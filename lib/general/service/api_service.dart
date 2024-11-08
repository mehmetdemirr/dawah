// ignore_for_file: lines_longer_than_80_chars, avoid_dynamic_calls

import 'dart:convert';
import 'package:davet/config.dart';
import 'package:davet/general/enum/http_methods.dart';
import 'package:davet/general/model/base_response.dart';
import 'package:davet/general/service/auth.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  ApiService() : dio = Dio() {
    dio.options
      ..baseUrl = AppConfig.BASE_URL_API
      ..connectTimeout = const Duration(seconds: 14)
      ..receiveTimeout = const Duration(seconds: 14);
    dio.interceptors
      ..add(AuthInterceptor(dio))
      ..add(
        PrettyDioLogger(
          requestBody: AppConfig.debug,
          requestHeader: AppConfig.debug,
          responseHeader: AppConfig.debug,
        ),
      );
  }

  late Dio dio;

  Future<BaseResponse<T>> requestMethod<T>({
    required String path,
    required Map<String, dynamic>? headers,
    required T Function(dynamic) responseConverter,
    required dynamic requestModel,
    required HttpMethod method,
    Map<String, dynamic>? queryParameters,
    FormData? formData,
  }) async {
    try {
      Response<Map<String, dynamic>> response;

      switch (method) {
        case HttpMethod.get:
          response = await dio.get(
            path,
            options: Options(headers: headers),
            data: requestModel,
            queryParameters: queryParameters,
          );
        case HttpMethod.put:
          final data = json.encode(requestModel);
          response = await dio.put(
            path,
            options: Options(method: 'PUT', headers: headers),
            data: formData ?? (requestModel == null ? null : data),
            queryParameters: queryParameters,
          );
        case HttpMethod.post:
          final data = json.encode(requestModel);
          response = await dio.post(
            path,
            options: Options(method: 'POST', headers: headers),
            data: formData ?? (requestModel == null ? null : data),
            queryParameters: queryParameters,
          );
        case HttpMethod.delete:
          // Assuming you want to send requestModel in the body for delete,
          // modify this part according to your needs
          final data = requestModel != null ? json.encode(requestModel) : null;
          response = await dio.delete(
            path,
            options: Options(method: 'DELETE', headers: headers),
            data: requestModel == null ? null : data,
            queryParameters: queryParameters,
          );
      }
      return BaseResponse<T>(
        data: (response.data != null && response.statusCode == 200)
            ? responseConverter(response.data?['data'])
            : null,
        errors: response.data?['errors'],
        message: response.data?['message'],
        success: response.data?['success'] ?? false,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 504) {
        return BaseResponse(
          data: null,
          errors: 'Gateway Timeout!',
          success: false,
          message: null,
        );
      }
      if (e.response?.statusCode == 400) {
        return BaseResponse(
          data: null,
          errors: e.response?.data['errors'] as String?,
          success: false,
          message: e.response?.data['message'] as String?,
        );
      }
      if (e.response?.statusCode == 404) {
        return BaseResponse(
          data: null,
          errors: e.response?.data['errors'] as String? ?? 'İçerik bulunamadı!',
          success: false,
          message: null,
        );
      }
      if (e.response?.statusCode == 401) {
        return BaseResponse(
          data: null,
          errors: 'Oturum doğrulanamadı!',
          success: false,
          message: e.response?.data['message'] as String?,
        );
      }
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return BaseResponse(
            data: null,
            errors: 'Bağlantı zaman aşımına uğradı!',
            success: false,
            message: null,
          );
        case DioExceptionType.sendTimeout:
          return BaseResponse(
            data: null,
            errors: 'Gönderim zaman aşımına uğradı!',
            success: false,
            message: null,
          );
        case DioExceptionType.receiveTimeout:
          return BaseResponse(
            data: null,
            errors: 'Bağlantı ulaşımı zaman aşımına uğradı!',
            success: false,
            message: null,
          );
        case DioExceptionType.badCertificate:
          return BaseResponse(
            data: null,
            errors: 'Geçersiz sertifika!',
            success: false,
            message: null,
          );
        case DioExceptionType.badResponse:
          return BaseResponse(
            data: null,
            errors: e.response?.data.runtimeType is String
                ? e.response?.data as String
                : (e.response?.data as Map<String, dynamic>)['errors']
                    as String?,
            success: false,
            message: e.response?.data.runtimeType is String
                ? e.response?.data as String
                : (e.response?.data as Map<String, dynamic>)['messages']
                    as String?,
          );
        case DioExceptionType.cancel:
          return BaseResponse(
            data: null,
            errors: 'İptal Edildi!',
            success: false,
            message: null,
          );
        case DioExceptionType.connectionError:
          return BaseResponse(
            data: null,
            errors: 'Bağlantı hatası!',
            success: false,
            message: null,
          );
        case DioExceptionType.unknown:
          return BaseResponse(
            data: null,
            errors: 'Bilinmeyen bir hata oluştu!',
            success: false,
            message: null,
          );
      }
    }
  }
}
