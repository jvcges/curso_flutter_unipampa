import 'dart:developer' as developer;

void customLog(
  Object? object, {
  String? name,
  StackTrace? stackTrace,
  Object? error,
}) {
  developer.log(
    '$object',
    error: error,
    name: name ?? '',
    stackTrace: stackTrace,
  );
}