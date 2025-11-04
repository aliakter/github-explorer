import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/app/controllers/theme_controller.dart';
import 'package:github_explorer/presentation/controllers/repo_controller.dart';
import 'package:github_explorer/presentation/controllers/user_controller.dart';
import 'package:github_explorer/presentation/widgets/repo_grid_tile.dart';
import 'package:github_explorer/presentation/widgets/repo_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();
    final repoCtrl = Get.find<RepoController>();
    final themeCtrl = Get.find<ThemeController>();

    // Load repos when entering page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (repoCtrl.repos.isEmpty) repoCtrl.load(userCtrl.username.value);
    });

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Repos — ${userCtrl.username.value}')),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: themeCtrl.toggle,
          ),
          IconButton(
            icon: const Icon(Icons.view_module),
            onPressed: repoCtrl.toggleView,
          ),
          PopupMenuButton<RepoSort>(
            onSelected: repoCtrl.setSort,
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: RepoSort.updated,
                child: Text('Sort by Updated'),
              ),
              const PopupMenuItem(
                value: RepoSort.name,
                child: Text('Sort by Name'),
              ),
              const PopupMenuItem(
                value: RepoSort.stars,
                child: Text('Sort by Stars'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search repos...',
              ),
              onChanged: repoCtrl.setQuery,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (repoCtrl.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              final list = repoCtrl.filtered;
              if (list.isEmpty) {
                return const Center(child: Text('No repositories found'));
              }

              return Obx(() {
                return repoCtrl.viewIsGrid.value
                    ? GridView.builder(
                        padding: const EdgeInsets.all(8),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.6,
                            ),
                        itemCount: list.length,
                        itemBuilder: (_, i) => RepoGridTile(repo: list[i]),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: list.length,
                        itemBuilder: (_, i) => RepoListTile(repo: list[i]),
                      );
              });
            }),
          ),
        ],
      ),
    );
  }
}
