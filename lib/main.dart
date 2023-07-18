import 'package:curso_flutter_unipampa/provider/user_github_provider.dart';
import 'package:curso_flutter_unipampa/provider/user_provider.dart';
import 'package:curso_flutter_unipampa/views/user_github_list.dart';
import 'package:curso_flutter_unipampa/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => UserGithubProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Curso Flutter Unipampa',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[300]!),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const UserGithubList(),
      ),
    );
  }
}
