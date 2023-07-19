import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppSettings {
  static Future<void> init({
    String initialRoute = "/",
    required Module module,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    Modular.init(module);
    Modular.setInitialRoute(initialRoute);
  }
}
