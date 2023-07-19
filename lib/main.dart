import 'package:curso_flutter_unipampa/core/start/app_module.dart';
import 'package:curso_flutter_unipampa/core/start/app_root.dart';
import 'package:curso_flutter_unipampa/core/start/app_settings.dart';
import 'package:flutter/material.dart';

void main() async {
  await AppSettings.init(module: AppModule());
  const app = AppRoot();
  runApp(app);
}
