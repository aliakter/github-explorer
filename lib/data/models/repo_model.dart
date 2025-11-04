import 'package:github_explorer/domain/entities/repo.dart';

class RepoModel extends Repo {
  RepoModel({required super.id, required super.name, super.fullName, super.description, super.language, super.stargazersCount, super.forksCount, super.updatedAt, super.htmlUrl});


  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      id: json['id'],
      name: json['name'] ?? '',
      fullName: json['full_name'],
      description: json['description'],
      language: json['language'],
      stargazersCount: json['stargazers_count'] ?? 0,
      forksCount: json['forks_count'] ?? 0,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      htmlUrl: json['html_url'],
    );
  }
}