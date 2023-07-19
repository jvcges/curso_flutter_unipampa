import 'package:curso_flutter_unipampa/app/data/datasources/get_github_user_by_name/get_github_user_by_name_datasource.dart';
import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:curso_flutter_unipampa/core/services/services.dart';

final $GetGithubUserByNameImpDatasource = BindInject(
  (i) => GetGithubUserByNameImpDatasource(i()),
  isSingleton: true,
  isLazy: true,
);

class GetGithubUserByNameImpDatasource
    implements GetGithubUserByNameDatasource {
  final ClientHttps _clientHttps;

  GetGithubUserByNameImpDatasource(ClientHttps clientHttps)
      : _clientHttps = clientHttps;

  final _endpoint = '/users';

  @override
  Future<UserGithubDto> call(String name) async {
    final result = await _clientHttps.get('$_endpoint/$name');

    return UserGithubDto.fromMap(result.data);
  }
}
