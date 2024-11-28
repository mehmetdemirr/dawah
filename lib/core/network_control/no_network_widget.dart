import 'package:davet/core/network_control/network_change_manager.dart';
import 'package:davet/core/utilty/duration_items.dart';
import 'package:flutter/material.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({super.key});
  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> {
  late final INetworkManager _networkChange;
  NetworkResult? _networkResult;
  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    fetchFirstResult();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _networkChange.handlerNetworkChange(_updateView);
    });
  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _networkResult = await _networkChange.checkNetworkFirstTime();
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40,
          child: Text(
            'İnternet Yok !',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
      secondChild: const SizedBox(),
      crossFadeState: _networkResult == NetworkResult.off
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: DurationItem.small.str(),
    );
  }
}
