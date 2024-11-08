import 'package:davet/core/cache/shared_pref.dart';
import 'package:davet/core/log/log.dart';
import 'package:davet/core/navigation/app_router.dart';
import 'package:davet/main.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Burada istekle ilgili ek ayarlamaları yapabilirsiniz, örneğin, token eklemek gibi
    String? userAccessToken = await SharedPref().getUserToken();
    if (userAccessToken != null) {
      Log.success('onrequestAlanında $userAccessToken');
      options.headers['Authorization'] = 'Bearer $userAccessToken';
      options.headers['Content-Type'] = 'application/json';
      options.headers['Accept'] = 'application/json';
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    Log.error(err.toString());
    if (err.response?.statusCode == 401) {
      await SharedPref().clearAll();
      getIt<AppRouter>().replaceAll([
        // const LoginRoute(),
      ]);
      return handler.next(err);
    } else {
      return handler.next(err);
    }
  }
}
