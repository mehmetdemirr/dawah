// ignore_for_file: lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  BaseResponse({
    required this.data,
    required this.errors,
    required this.success,
    required this.message,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }
  @JsonKey(name: 'data')
  final T? data;

  @JsonKey(name: 'errors')
  final String? errors;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'success')
  final bool success;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$BaseResponseToJson(this, toJsonT);
  }
}
