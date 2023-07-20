import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:curso_flutter_unipampa/app/domain/models/exceptions/custom_exception.dart';
import 'package:curso_flutter_unipampa/app/domain/models/presentation/response_presentation.dart';
import 'package:curso_flutter_unipampa/app/domain/usecases/get_github_user_by_name/get_github_user_by_name_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'user_details_page_controller.g.dart';

final $UserDetailsPageController = BindInject(
  (i) => UserDetailsPageController(i()),
  isLazy: true,
  isSingleton: true,
);

class UserDetailsPageController = _UserDetailsPageControllerBase
    with _$UserDetailsPageController;

abstract class _UserDetailsPageControllerBase with Store {
  final GetGithubUserByNameUsecase _getGithubUserByNameUsecase;

  _UserDetailsPageControllerBase(this._getGithubUserByNameUsecase);

  @observable
  bool loading = false;

  @observable
  UserGithubDto? user;

  @action
  void setLoading(bool value) => loading = value;

  @action
  void setUser(UserGithubDto? value) => user = value;

  @action
  Future<ResponsePresentation> getUserByName() async {
    try {
      loading = true;
      if (user?.login == null) {
        return ResponsePresentation(message: 'Nome nulo');
      }

      final response = await _getGithubUserByNameUsecase(user!.login!);

      setUser(response);
      return ResponsePresentation(payload: user);
    } on CustomException catch (e) {
      return ResponsePresentation(error: e.error ?? '', message: e.message);
    } finally {
      loading = false;
    }
  }
}
