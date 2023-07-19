import 'package:curso_flutter_unipampa/app/domain/models/exceptions/custom_exception.dart';

class GenericException extends CustomException {
  GenericException([Object? exception])
      : super(
          message: 'Ocorreu um erro inesperado!',
          error: 'ERROR_GENERIC',
          exception: exception,
        );
}
