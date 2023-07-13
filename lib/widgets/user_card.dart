import 'package:curso_flutter_unipampa/provider/user_provider.dart';
import 'package:curso_flutter_unipampa/views/user_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of(context);
    final avatar = user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return Card(
      elevation: 2,
      child: ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => UserForm(
                              isEdit: true,
                              user: user,
                            )))),
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[300],
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: const Text('Excluir Usuário'),
                            content: const Text('Você tem certeza?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Não'),
                              ),
                              TextButton(
                                onPressed: () {
                                  userProvider.remove(user.id!);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Sim'),
                              ),
                            ],
                          ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
