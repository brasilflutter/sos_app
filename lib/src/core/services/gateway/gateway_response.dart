class GatewayResponse<T> {
  GatewayResponse({
    required this.data,
    required this.statusCode,
  });
  final T data;
  final int statusCode;
}
