import 'package:dio/dio.dart';

import 'gateway_response.dart';

abstract interface class IGateway {
  Future<GatewayResponse<T>> get<T>({
    required String endpoint,
    String? baseUrl,
    int timeout = 25,
    Options? options,
  });
  Future<GatewayResponse<T>> post<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    int timeout = 25,
    Options? options,
  });
  Future<GatewayResponse<T>> put<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    int timeout = 25,
    Options? options,
  });
  Future<GatewayResponse<T>> delete<T>({
    required String endpoint,
    required dynamic data,
    String? baseUrl,
    int timeout = 25,
    Options? options,
  });
}
