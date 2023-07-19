import 'package:curso_flutter_unipampa/app/data/datasources/get_github_user_by_name/get_github_user_by_name_datasource.dart';
import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:curso_flutter_unipampa/app/domain/models/loggers/logger.dart';
import 'package:curso_flutter_unipampa/app/domain/repositories/get_github_user_by_name/get_github_user_by_name_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:curso_flutter_unipampa/app/domain/models/exceptions/custom_exception.dart';
import 'package:curso_flutter_unipampa/app/domain/models/exceptions/generic_exception.dart';

final $GetGithubUserByNameImpRepository = BindInject(
  (i) => GetGithubUserByNameImpRepository(i.get()),
  isSingleton: true,
  isLazy: true,
);

class GetGithubUserByNameImpRepository
    implements GetGithubUserByNameRepository {
  final GetGithubUserByNameDatasource _getGithubUserByNameDatasource;

  GetGithubUserByNameImpRepository(this._getGithubUserByNameDatasource);

  @override
  Future<UserGithubDto> call(String name) async {
    try {
      return await _getGithubUserByNameDatasource(name);
    } on CustomException catch (e) {
      customLog(e);
      rethrow;
    } catch (e) {
      throw GenericException();
    }
  }
}
