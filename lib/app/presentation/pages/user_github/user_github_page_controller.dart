import 'package:curso_flutter_unipampa/app/domain/models/exceptions/custom_exception.dart';
import 'package:curso_flutter_unipampa/app/domain/models/presentation/response_presentation.dart';
import 'package:curso_flutter_unipampa/app/domain/usecases/get_github_user_by_name/get_github_user_by_name_usecase.dart';
import 'package:curso_flutter_unipampa/app/domain/usecases/get_github_user_list/get_github_user_list_usecase.dart';
import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'user_github_page_controller.g.dart';

final $UserGithubPageController = BindInject(
  (i) => UserGithubPageController(i(), i()),
  isLazy: true,
  isSingleton: true,
);

class UserGithubPageController = _UserGithubPageControllerBase
    with _$UserGithubPageController;

abstract class _UserGithubPageControllerBase with Store {
  final GetGithubUserListUsecase _getGithubUserListUsecase;
  final GetGithubUserByNameUsecase _getGithubUserByNameUsecase;

  _UserGithubPageControllerBase(
    this._getGithubUserListUsecase,
    this._getGithubUserByNameUsecase,
  );

  @observable
  bool loading = false;

  @observable
  List<UserGithubDto> userList = [];

  @action
  Future<ResponsePresentation> getAllUsers() async {
    try {
      loading = true;

      final response = await _getGithubUserListUsecase();

      userList.clear();
      userList.addAll(response);
      return ResponsePresentation(payload: userList);
    } on CustomException catch (e) {
      userList.clear();
      return ResponsePresentation(error: e.error ?? '', message: e.message);
    } finally {
      loading = false;
    }
  }

  @action
  Future<ResponsePresentation> getUserByName(String name) async {
    try {
      loading = true;

      final response = await _getGithubUserByNameUsecase(name);

      userList.clear();
      userList.add(response);
      return ResponsePresentation(payload: userList);
    } on CustomException catch (e) {
      userList.clear();
      return ResponsePresentation(error: e.error ?? '', message: e.message);
    } finally {
      loading = false;
    }
  }
}
