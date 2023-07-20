import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRouters {
  static goToGithubUserList() async {
    return Modular.to.pushNamed('/');
  }

  static goToUserDetailsPage({required UserGithubDto user}) async {
    return Modular.to.pushNamed('/details', arguments: {
      'user': user,
    });
  }

  AppRouters._();
}
