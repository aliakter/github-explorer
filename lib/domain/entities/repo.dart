class Repo {
  final int id;
  final String name;
  final String? fullName;
  final String? description;
  final String? language;
  final int? stargazersCount;
  final int? forksCount;
  final DateTime? updatedAt;
  final String? htmlUrl;


  Repo({required this.id, required this.name, this.fullName, this.description, this.language, this.stargazersCount, this.forksCount, this.updatedAt, this.htmlUrl});
}