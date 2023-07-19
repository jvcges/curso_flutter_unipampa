import 'dart:async';

import 'package:curso_flutter_unipampa/app/presentation/components/user_github_card.dart';
import 'package:curso_flutter_unipampa/app/presentation/pages/user_github/user_github_page_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserGithubList extends StatefulWidget {
  const UserGithubList({super.key});

  @override
  State<UserGithubList> createState() => _UserGithubListState();
}

class _UserGithubListState extends State<UserGithubList> {
  final _controller = Modular.get<UserGithubPageController>();
  final _nameController = TextEditingController();
  Timer? _searchTimer;

  @override
  void initState() {
    _controller.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários do Github'),
        backgroundColor: Colors.green[300],
      ),
      body: Observer(builder: (context) {
        return Column(
          children: [
            _buildNameSearch(),
            Expanded(
              child: _controller.loading == false
                  ? ListView.builder(
                      itemCount: _controller.userList.length,
                      itemBuilder: (context, index) => UserGithubCard(
                          userDto: _controller.userList.elementAt(index)),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        );
      }),
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
          _searchTimer?.cancel();
          _searchTimer = Timer(const Duration(milliseconds: 800), () {
            if (value.isEmpty) {
              _controller.getAllUsers();
            } else {
              _controller.getUserByName(value);
            }
          });
        },
      ),
    );
  }
}
