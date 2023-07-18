import 'package:curso_flutter_unipampa/models/user_github_dto.dart';
import 'package:flutter/material.dart';

class UserGithubCard extends StatelessWidget {
  final UserGithubDto userDto;
  final Function()? onTap;
  const UserGithubCard({
    super.key,
    required this.userDto,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final height = _size.height;
    final width = _size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.005),
          child: InkWell(
            onTap: onTap,
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
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width > 500 ? width * 0.2 : width * 0.2,
                      height: height > 1000 ? height * 0.2 : height * 0.1,
                      child: _getImage(),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            userDto.name ?? userDto.login ?? '',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22,
                            ),
                            softWrap: true,
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getImage() {
    if (userDto.avatarUrl != null && userDto.avatarUrl!.isNotEmpty) {
      return CircleAvatar(backgroundImage: NetworkImage(userDto.avatarUrl!));
    }

    return const CircleAvatar(child: Icon(Icons.person));
  }
}
