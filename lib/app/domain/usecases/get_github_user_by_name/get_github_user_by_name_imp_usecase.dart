import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:curso_flutter_unipampa/app/domain/repositories/get_github_user_by_name/get_github_user_by_name_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'get_github_user_by_name_usecase.dart';

final $GetGithubUserByNameImpUsecase = BindInject(
  (i) => GetGithubUserByNameImpUsecase(i.get()),
  isSingleton: true,
  isLazy: true,
);

class GetGithubUserByNameImpUsecase implements GetGithubUserByNameUsecase {
  final GetGithubUserByNameRepository _getGithubUserByNameRepository;

  GetGithubUserByNameImpUsecase(this._getGithubUserByNameRepository);

  @override
  Future<UserGithubDto> call(String name) async {
    return await _getGithubUserByNameRepository(name);
  }
}
