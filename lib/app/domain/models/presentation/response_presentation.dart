class ResponsePresentation {
  final String? message;
  final bool success;
  final String error;
  final dynamic payload;

  ResponsePresentation({
    this.success = true,
    this.message,
    this.error = '',
    this.payload,
  });
}
