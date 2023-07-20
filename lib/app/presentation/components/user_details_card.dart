import 'package:curso_flutter_unipampa/app/domain/models/dtos/user_github/user_github_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailsCard extends StatelessWidget {
  final UserGithubDto user;
  const UserDetailsCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final height = _size.height;
    final width = _size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.005,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 14,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _getImage(),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: user.publicRepos?.toString() ?? '0',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: '\n',
                          ),
                          const TextSpan(
                            text: 'Repositórios\nPúblicos',
                            style: TextStyle(fontSize: 12),
                          ),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: user.followers?.toString() ?? '0',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: '\n',
                          ),
                          const TextSpan(
                            text: 'Seguidores',
                            style: TextStyle(fontSize: 12),
                          ),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                            text: user.following?.toString() ?? '0',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text: '\n',
                          ),
                          const TextSpan(
                            text: 'Seguindo',
                            style: TextStyle(fontSize: 12),
                          ),
                        ]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (user.name != null)
                        Text(
                          "${user.name}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                          softWrap: true,
                          maxLines: 5,
                        ),
                      if (user.name != null) const SizedBox(height: 10),
                      if (user.login != null)
                        Text(
                          "Login: ${user.login}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                          softWrap: true,
                          maxLines: 5,
                        ),
                      if (user.login != null) const SizedBox(height: 10),
                      if (user.email != null)
                        Text(
                          "Email: ${user.email}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                          softWrap: true,
                          maxLines: 5,
                        ),
                      if (user.email != null) const SizedBox(height: 10),
                      if (user.bio != null)
                        Text(
                          "Biografia: ${user.bio}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                          softWrap: true,
                          maxLines: 5,
                        ),
                      if (user.bio != null) const SizedBox(height: 10),
                      if (user.location != null)
                        Text(
                          "Cidade: ${user.location}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                          softWrap: true,
                          maxLines: 5,
                        ),
                      if (user.location != null) const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getImage() {
    if (user.avatarUrl != null && user.avatarUrl!.isNotEmpty) {
      return CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl!), radius: 40);
    }

    return const CircleAvatar(
      child: Icon(Icons.person),
      radius: 40,
    );
  }
}
