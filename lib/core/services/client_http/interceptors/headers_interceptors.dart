import 'package:dio/dio.dart';

class HeadersInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers["Accept"] = "application/vnd.github+json";
    options.headers["Authorization"] =
        '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';
    options.headers["X-GitHub-Api-Version"] = "2022-11-28";

    return handler.next(options);
  }
}
