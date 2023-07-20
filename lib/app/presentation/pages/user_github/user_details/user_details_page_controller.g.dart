// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserDetailsPageController on _UserDetailsPageControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_UserDetailsPageControllerBase.loading', context: context);

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

  late final _$userAtom =
      Atom(name: '_UserDetailsPageControllerBase.user', context: context);

  @override
  UserGithubDto? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserGithubDto? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$getUserByNameAsyncAction = AsyncAction(
      '_UserDetailsPageControllerBase.getUserByName',
      context: context);

  @override
  Future<ResponsePresentation> getUserByName() {
    return _$getUserByNameAsyncAction.run(() => super.getUserByName());
  }

  late final _$_UserDetailsPageControllerBaseActionController =
      ActionController(
          name: '_UserDetailsPageControllerBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_UserDetailsPageControllerBaseActionController
        .startAction(name: '_UserDetailsPageControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_UserDetailsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(UserGithubDto? value) {
    final _$actionInfo = _$_UserDetailsPageControllerBaseActionController
        .startAction(name: '_UserDetailsPageControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserDetailsPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
user: ${user}
    ''';
  }
}
