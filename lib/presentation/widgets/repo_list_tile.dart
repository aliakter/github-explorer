import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/domain/entities/repo.dart';

class RepoListTile extends StatelessWidget {
  final Repo repo;

  const RepoListTile({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(repo.name),
        subtitle: Text(repo.description ?? 'No description'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('${repo.stargazersCount ?? 0} ★')],
        ),
        onTap: () => Get.toNamed('/details', arguments: repo),
      ),
    );
  }
}
