import 'dart:math';

import 'package:curso_flutter_unipampa/data/data_users.dart';
import 'package:curso_flutter_unipampa/models/user.dart';
import 'package:curso_flutter_unipampa/models/user_github_dto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class UserGithubProvider with ChangeNotifier {
  final baseUrl = 'https://api.github.com/users';
  bool loading = false;
  List<UserGithubDto> userList = [];

  void getAllUsers() async {
    try {
      loading = true;
      notifyListeners();
      final response = await http.get(Uri.parse(baseUrl),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final list = response.body as List;
        final users = list.map((e) => UserGithubDto.fromJson(e)).toList();
        userList = users;
        notifyListeners();
      } else {
        userList.clear();
        return;
      }
    } catch (error) {
      userList.clear();
      return;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
