import 'package:curso_flutter_unipampa/app/domain/repositories/get_github_user_list/get_github_user_list_repository.dart';
import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'get_github_user_list_usecase.dart';

final $GetGithubUserListImpUsecase = BindInject(
  (i) => GetGithubUserListImpUsecase(i.get()),
  isSingleton: true,
  isLazy: true,
);

class GetGithubUserListImpUsecase implements GetGithubUserListUsecase {
  final GetGithubUserListRepository _getGithubUserListRepository;

  GetGithubUserListImpUsecase(this._getGithubUserListRepository);

  @override
  Future<List<UserGithubDto>> call() async {
    return await _getGithubUserListRepository();
  }
}
