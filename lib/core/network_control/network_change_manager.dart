// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:davet/core/function/print_function.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkManager {
  Future<NetworkResult> checkNetworkFirstTime();
  void handlerNetworkChange(void Function(NetworkResult result) onChange);
  void dispose();
}

class NetworkChangeManager extends INetworkManager {
  late final Connectivity _connectivity;
  StreamSubscription<ConnectivityResult>? _subscription;
  NetworkChangeManager() {
    _connectivity = Connectivity();
  }
  @override
  Future<NetworkResult> checkNetworkFirstTime() async {
    final List<ConnectivityResult> connectivityResult =
        await _connectivity.checkConnectivity();
    return NetworkResult.checkConnectivityResult(connectivityResult[0]);
  }

  @override
  void handlerNetworkChange(void Function(NetworkResult result) onChange) {
    // StreamSubscription<List<ConnectivityResult>> subscription
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      onChange.call(NetworkResult.checkConnectivityResult(result[0]));
    });

    // _subscription =
    //     _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> result) {
    //   onChange.call(NetworkResult.checkConnectivityResult(result));
    // });
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }
}

enum NetworkResult {
  on,
  off;

  static NetworkResult checkConnectivityResult(ConnectivityResult result) {
    printf(result.toString());
    switch (result) {
      case ConnectivityResult.bluetooth:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
      case ConnectivityResult.mobile:
        return NetworkResult.on;
      case ConnectivityResult.none:
        return NetworkResult.off;
      default:
        return NetworkResult.off;
    }
  }
}
