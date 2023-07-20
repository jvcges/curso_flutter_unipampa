import 'dart:convert';

class UserGithubDto {
  final String? login;
  final String? id;
  final String? avatarUrl;
  final String? email;
  final String? name;
  final String? bio;
  final String? location;
  final int? publicRepos;
  final int? followers;
  final int? following;
  UserGithubDto({
    this.login,
    this.id,
    this.avatarUrl,
    this.email,
    this.name,
    this.bio,
    this.location,
    this.publicRepos,
    this.followers,
    this.following,
  });

  UserGithubDto copyWith({
    String? login,
    String? id,
    String? avatarUrl,
    String? email,
    String? name,
    String? bio,
    String? location,
    int? publicRepos,
    int? followers,
    int? following,
  }) {
    return UserGithubDto(
      login: login ?? this.login,
      id: id ?? this.id,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      publicRepos: publicRepos ?? this.publicRepos,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (login != null) {
      result.addAll({'login': login});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (avatarUrl != null) {
      result.addAll({'avatar_url': avatarUrl});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (bio != null) {
      result.addAll({'bio': bio});
    }
    if (location != null) {
      result.addAll({'location': location});
    }
    if (publicRepos != null) {
      result.addAll({'public_repos': publicRepos});
    }
    if (followers != null) {
      result.addAll({'followers': followers});
    }
    if (following != null) {
      result.addAll({'following': following});
    }

    return result;
  }

  factory UserGithubDto.fromMap(Map<String, dynamic> map) {
    return UserGithubDto(
      login: map['login'],
      id: map['id'].toString(),
      avatarUrl: map['avatar_url'],
      email: map['email'],
      name: map['name'],
      bio: map['bio'],
      location: map['location'],
      publicRepos: map['public_repos']?.toInt(),
      followers: map['followers']?.toInt(),
      following: map['following']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserGithubDto.fromJson(String source) =>
      UserGithubDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserGithubDto(login: $login, id: $id, avatarUrl: $avatarUrl, email: $email, name: $name, bio: $bio, location: $location, publicRepos: $publicRepos, followers: $followers, following: $following)';
  }
}
