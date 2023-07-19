// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_github_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserGithubPageController on _UserGithubPageControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_UserGithubPageControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$userListAtom =
      Atom(name: '_UserGithubPageControllerBase.userList', context: context);

  @override
  List<UserGithubDto> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<UserGithubDto> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$getAllUsersAsyncAction = AsyncAction(
      '_UserGithubPageControllerBase.getAllUsers',
      context: context);

  @override
  Future<ResponsePresentation> getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
userList: ${userList}
    ''';
  }
}
