import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/domain/entities/repo.dart';

class RepoGridTile extends StatelessWidget {
  final Repo repo;
  const RepoGridTile({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Get.toNamed('/details', arguments: repo),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(repo.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Expanded(child: Text(repo.description ?? 'No description', overflow: TextOverflow.fade)),
            const SizedBox(height: 6),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(repo.language ?? '-'), Text('${repo.stargazersCount ?? 0} ★')])
          ]),
        ),
      ),
    );
  }
}