import 'package:github_explorer/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.login, super.avatarUrl, super.name, super.bio});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'] ?? "",
      avatarUrl: json['avatar_url'] ?? "",
      name: json['name'] ?? "",
      bio: json['bio'] ?? "",
    );
  }
}
