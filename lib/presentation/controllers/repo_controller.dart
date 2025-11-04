import 'package:get/get.dart';
import 'package:github_explorer/domain/entities/repo.dart';
import 'package:github_explorer/domain/repositories/github_repository.dart';

enum RepoSort { name, updated, stars }

class RepoController extends GetxController {
  final GitHubRepository _repo;

  RepoController(this._repo);

  final repos = <Repo>[].obs;
  final filtered = <Repo>[].obs;
  final isLoading = false.obs;
  final viewIsGrid = false.obs;
  final sortBy = RepoSort.updated.obs;
  final query = ''.obs;

  Future<void> load(String username) async {
    try {
      isLoading.value = true;
      final r = await _repo.getRepos(username);
      repos.assignAll(r);
      applyFilters();
    } catch (e) {
      Get.snackbar('Error', 'Could not load repositories');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleView() => viewIsGrid.value = !viewIsGrid.value;

  void setSort(RepoSort s) {
    sortBy.value = s;
    applyFilters();
  }

  void setQuery(String q) {
    query.value = q;
    applyFilters();
  }

  void applyFilters() {
    var list = repos.toList();
    if (query.value.isNotEmpty) {
      final q = query.value.toLowerCase();
      list = list.where((r) => r.name.toLowerCase().contains(q) || (r.description ?? '').toLowerCase().contains(q)).toList();
    }

    switch (sortBy.value) {
      case RepoSort.name:
        list.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        break;
      case RepoSort.stars:
        list.sort((b, a) => (a.stargazersCount ?? 0).compareTo(b.stargazersCount ?? 0));
        break;
      case RepoSort.updated:
        list.sort((b, a) => (a.updatedAt ?? DateTime(0)).compareTo(b.updatedAt ?? DateTime(0)));
        break;
    }

    filtered.assignAll(list);
  }
}
