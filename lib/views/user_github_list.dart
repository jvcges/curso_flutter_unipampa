import 'dart:convert';

import 'package:curso_flutter_unipampa/provider/user_github_provider.dart';
import 'package:curso_flutter_unipampa/views/user_list.dart';
import 'package:curso_flutter_unipampa/widgets/user_github_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/user_github_dto.dart';

class UserGithubList extends StatefulWidget {
  const UserGithubList({super.key});

  @override
  State<UserGithubList> createState() => _UserGithubListState();
}

class _UserGithubListState extends State<UserGithubList> {
  bool loading = false;
  List<UserGithubDto> usersList = [];
  final baseUrl = 'https://api.github.com/users';
  final _nameController = TextEditingController();

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários do Github'),
        backgroundColor: Colors.green[300],
      ),
      body: Column(
        children: [
          _buildNameSearch(),
          Expanded(
            child: loading == false
                ? ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) =>
                        UserGithubCard(userDto: usersList.elementAt(index)),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        controller: _nameController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'Filtrar por nome',
          labelStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.length > 3) {
            getUserByName(value);
          }
        },
      ),
    );
  }

  void getAllUsers() async {
    try {
      setState(() {
        loading = true;
      });
      final response = await http.get(Uri.parse(baseUrl),
          headers: {'accept': 'application/vnd.github+json'});

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final list = jsonResponse as List;
        final users = list.map((e) => UserGithubDto.fromMap(e)).toList();
        print(users);
        setState(() {
          usersList = users;
        });
      } else {
        print(response.statusCode);
        setState(() {
          usersList.clear();
        });
      }
      return;
    } catch (e) {
      print('Ocorreu um erro $e');
      setState(() {
        usersList.clear();
      });

      return;
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void getUserByName(String name) async {
    try {
      setState(() {
        loading = true;
      });
      final response = await http.get(Uri.parse('$baseUrl/$name'), headers: {
        'Accept': 'application/vnd.github+json',
        'Authorization': 'Bearer SEU_TOKEN_AQUI',
        "X-GitHub-Api-Version": "2022-11-28",
      });

      if (response.statusCode == 200) {
        final user = UserGithubDto.fromJson(response.body);
        print(user);
        setState(() {
          usersList.clear();
          usersList.add(user);
        });
      } else {
        print(response.statusCode);
        setState(() {
          usersList.clear();
        });
      }
      return;
    } catch (e) {
      print('Ocorreu um erro $e');
      setState(() {
        usersList.clear();
      });

      return;
    } finally {
      setState(() {
        loading = false;
      });
    }
  }
}
