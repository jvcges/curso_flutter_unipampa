import 'package:curso_flutter_unipampa/app/data/datasources/get_github_user_list/get_github_user_list_datasource.dart';
import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:curso_flutter_unipampa/core/services/services.dart';

final $GetGithubUserListImpDatasource = BindInject(
  (i) => GetGithubUserListImpDatasource(i()),
  isSingleton: true,
  isLazy: true,
);

class GetGithubUserListImpDatasource implements GetGithubUserListDatasource {
  final ClientHttps _clientHttps;

  GetGithubUserListImpDatasource(ClientHttps clientHttps)
      : _clientHttps = clientHttps;

  final _endpoint = '/users';

  @override
  Future<List<UserGithubDto>> call() async {
    final result = await _clientHttps.get(_endpoint);

    return (result.data as List).map((e) => UserGithubDto.fromMap(e)).toList();
  }
}
