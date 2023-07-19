import 'package:curso_flutter_unipampa/core/services/client_http/base/base_string_helper.dart';
import 'package:curso_flutter_unipampa/core/services/client_http/interceptors/headers_interceptors.dart';
import 'package:curso_flutter_unipampa/core/services/client_http/interceptors/loggers_interceptors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'base/client_base_impl.dart';

final $ClientHttps = BindInject(
  (i) => ClientHttps(
    interceptors: [
      LoggersInterceptors(),
      HeadersInterceptors(),
    ],
  ),
  isLazy: true,
  isSingleton: true,
);

class ClientHttps extends ClientHttpsBaseImpl {
  ClientHttps({
    List<Interceptor>? interceptors,
  }) : super(
          BaseOptions(
            baseUrl: BaseStringHelper.staging().baseUrl,
            sendTimeout: BaseStringHelper.staging().timeout,
            connectTimeout: BaseStringHelper.staging().timeout,
            receiveTimeout: BaseStringHelper.staging().timeout,
          ),
          interceptors: interceptors,
        );
}
