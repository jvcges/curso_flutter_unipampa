import 'package:curso_flutter_unipampa/models/user.dart';
import 'package:curso_flutter_unipampa/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  final User? user;
  final bool isEdit;
  const UserForm({super.key, this.user, required this.isEdit});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _avatarUrlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.isEdit) {
      _nameController.text = widget.user?.name ?? "";
      _emailController.text = widget.user?.email ?? "";
      _avatarUrlController.text = widget.user?.avatarUrl ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: widget.isEdit ? Text('Editar Usuário') : Text('Novo Usuário'),
        backgroundColor: Colors.green[300],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: "Nome",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return "Campo em branco";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.mail_sharp),
                    ),
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        return null;
                      } else {
                        return "Campo em branco";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _avatarUrlController,
                    keyboardType: TextInputType.none,
                    decoration: const InputDecoration(
                      labelText: "Url do avatar",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.cloud_upload_rounded),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            return;
          }

          _userProvider.put(User(
            id: widget.isEdit ? widget.user!.id : null,
            name: _nameController.text,
            email: _emailController.text,
            avatarUrl: _avatarUrlController.text,
          ));

          Navigator.of(context).pop();
        },
        label: const Text('Salvar'),
        icon: const Icon(Icons.person_add_alt_1_sharp),
      ),
    );
  }
}
