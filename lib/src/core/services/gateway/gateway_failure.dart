class GatewayFailure implements Exception {
  GatewayFailure({
    required this.message,
    this.statusCode = 500,
    this.stackTrace,
  });
  final String message;
  final int statusCode;
  final StackTrace? stackTrace;
}
