import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import 'gateway_failure.dart';
import 'gateway_response.dart';
import 'igateway.dart';

class DioGateway implements IGateway {
  DioGateway({
    required String baseUrl,
    List<Interceptor> interceptors = const [],
  }) {
    _gateway = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    _gateway.interceptors.addAll(interceptors);
  }
  late Dio _gateway;

  Dio _build({String? baseUrl}) {
    if (baseUrl != null) {
      _gateway.options.baseUrl = baseUrl;
    }
    _gateway.options.headers['Accept'] = 'application/json';
    _gateway.options.headers['Content-Type'] = 'application/json';
    return _gateway;
  }

  IGateway setHeaders({required Map<String, dynamic> headers}) {
    _gateway.options.headers.addAll(headers);
    return this;
  }

  @override
  Future<GatewayResponse<T>> get<T>({
    required String endpoint,
    String? baseUrl,
    int timeout = 25,
    Options? options,
  }) async {
    try {
      final response = await _build(baseUrl: baseUrl).get(endpoint, options: options).timeout(
            Duration(seconds: timeout),
          );
      return GatewayResponse<T>(
        data: response.data,
        statusCode: response.statusCode!,
      );
    } catch (e, s) {
      throw errorHandler(e, stackTrace: s);
    }
  }

  @override
  Future<GatewayResponse<T>> post<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    int timeout = 25,
    Options? options,
  }) async {
    try {
      final response = await _build(
        baseUrl: baseUrl,
      )
          .post(
            endpoint,
            data: data,
            options: options,
          )
          .timeout(
            Duration(
              seconds: timeout,
            ),
          );
      return GatewayResponse<T>(
        data: response.data,
        statusCode: response.statusCode!,
      );
    } catch (e, s) {
      throw errorHandler(e, stackTrace: s);
    }
  }

  @override
  Future<GatewayResponse<T>> put<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    int timeout = 25,
    Options? options,
  }) async {
    try {
      final response = await _build(
        baseUrl: baseUrl,
      )
          .put(
            endpoint,
            data: data,
            options: options,
          )
          .timeout(
            Duration(
              seconds: timeout,
            ),
          );
      return GatewayResponse<T>(
        data: response.data,
        statusCode: response.statusCode!,
      );
    } catch (e, s) {
      throw errorHandler(e, stackTrace: s);
    }
  }

  @override
  Future<GatewayResponse<T>> delete<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    int timeout = 25,
    Options? options,
  }) async {
    try {
      final response = await _build(
        baseUrl: baseUrl,
      )
          .delete(
            endpoint,
            data: data,
            options: options,
          )
          .timeout(
            Duration(
              milliseconds: timeout,
            ),
          );
      return GatewayResponse<T>(
        data: response.data,
        statusCode: response.statusCode!,
      );
    } catch (e, s) {
      throw errorHandler(e, stackTrace: s);
    }
  }

  GatewayFailure errorHandler(Object e, {StackTrace? stackTrace}) {
    if (e is DioException) {
      if (e.error is SocketException) {
        return GatewayFailure(
          message: 'semConexao',
          statusCode: 503,
        );
      }
      return GatewayFailure(
        message: 'erroDesconhecido',
        statusCode: e.response?.statusCode ?? 500,
      );
    } else if (e is TimeoutException) {
      return GatewayFailure(
        message: 'timeOutMensagem',
        statusCode: 408,
      );
    } else {
      return GatewayFailure(
        message: 'erroGenerico',
      );
    }
  }
}
