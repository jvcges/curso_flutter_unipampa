import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';

abstract class GetGithubUserListUsecase {
  Future<List<UserGithubDto>> call();
}
