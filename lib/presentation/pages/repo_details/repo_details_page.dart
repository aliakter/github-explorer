import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/core/Utils/utils.dart';
import 'package:github_explorer/domain/entities/repo.dart';

class RepoDetailsPage extends StatelessWidget {
  const RepoDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Repo repo = Get.arguments as Repo;

    return Scaffold(
      appBar: AppBar(title: Text(repo.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repo.fullName ?? repo.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(repo.description ?? 'No description'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: [
                Chip(label: Text('Stars: ${repo.stargazersCount ?? 0}')),
                Chip(label: Text('Forks: ${repo.forksCount ?? 0}')),
                Chip(label: Text('Language: ${repo.language ?? '-'}')),
                Chip(label: Text('Updated: ${formatDate(repo.updatedAt)}')),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () => launchRepo(repo.htmlUrl),
                child: const Text('Open on GitHub'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
