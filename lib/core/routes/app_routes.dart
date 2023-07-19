import 'package:flutter_modular/flutter_modular.dart';

class AppRouters {
  static goToGithubUserList() async {
    return Modular.to.pushNamed('/');
  }

  AppRouters._();
}
