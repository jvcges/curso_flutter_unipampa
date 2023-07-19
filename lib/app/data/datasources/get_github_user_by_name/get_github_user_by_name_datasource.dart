import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';

abstract class GetGithubUserByNameDatasource {
  Future<UserGithubDto> call(String name);
}
