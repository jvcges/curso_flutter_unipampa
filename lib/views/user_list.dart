import 'package:curso_flutter_unipampa/provider/user_provider.dart';
import 'package:curso_flutter_unipampa/views/user_form.dart';
import 'package:curso_flutter_unipampa/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
        backgroundColor: Colors.green[300],
      ),
      body: ListView.builder(
        itemCount: userProvider.count,
        itemBuilder: (context, index) =>
            UserCard(user: userProvider.byIndex(index)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Cadastrar'),
        icon: Icon(Icons.add_circle),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => const UserForm(
                      isEdit: false,
                    )))),
      ),
    );
  }
}
