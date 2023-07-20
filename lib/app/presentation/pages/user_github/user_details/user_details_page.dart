import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:curso_flutter_unipampa/app/presentation/components/user_details_card.dart';
import 'package:curso_flutter_unipampa/app/presentation/pages/user_github/user_details/user_details_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserDetailsPage extends StatefulWidget {
  final UserGithubDto user;
  const UserDetailsPage({super.key, required this.user});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final _controller = Modular.get<UserDetailsPageController>();
  final RefreshController _refreshController = RefreshController(
    initialRefreshStatus: RefreshStatus.idle,
  );

  @override
  void initState() {
    _controller.setUser(widget.user);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Usuário'),
        backgroundColor: Colors.green[300],
      ),
      body: Observer(builder: (context) {
        return SmartRefresher(
          header: WaterDropMaterialHeader(
            backgroundColor: Colors.green[300],
            color: Colors.white,
          ),
          controller: _refreshController,
          onRefresh: () => _onRefresh(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: _controller.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : UserDetailsCard(
                          user: _controller.user ?? UserGithubDto()),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void Function()? _onRefresh(BuildContext context) {
    _controller.getUserByName();
    _refreshController.refreshCompleted();
  }
}
