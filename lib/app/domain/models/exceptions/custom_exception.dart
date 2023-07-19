class CustomException implements Exception {
  final String? message;
  final String? error;
  final int? statusCode;
  final StackTrace? stackTrace;
  final dynamic exception;

  CustomException({
    this.message,
    this.error,
    this.statusCode,
    this.stackTrace,
    this.exception,
  });
}
