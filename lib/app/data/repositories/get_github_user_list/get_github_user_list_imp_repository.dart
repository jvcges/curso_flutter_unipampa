import 'package:curso_flutter_unipampa/app/data/datasources/get_github_user_list/get_github_user_list_datasource.dart';
import 'package:curso_flutter_unipampa/app/domain/models/loggers/logger.dart';
import 'package:curso_flutter_unipampa/app/domain/repositories/get_github_user_list/get_github_user_list_repository.dart';
import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:curso_flutter_unipampa/app/domain/models/exceptions/custom_exception.dart';
import 'package:curso_flutter_unipampa/app/domain/models/exceptions/generic_exception.dart';

final $GetGithubUserListImpRepository = BindInject(
  (i) => GetGithubUserListImpRepository(i.get()),
  isSingleton: true,
  isLazy: true,
);

class GetGithubUserListImpRepository implements GetGithubUserListRepository {
  final GetGithubUserListDatasource _getGithubUserListDatasource;

  GetGithubUserListImpRepository(this._getGithubUserListDatasource);

  @override
  Future<List<UserGithubDto>> call() async {
    try {
      return await _getGithubUserListDatasource();
    } on CustomException catch (e) {
      customLog(e);
      rethrow;
    } catch (e) {
      throw GenericException();
    }
  }
}
