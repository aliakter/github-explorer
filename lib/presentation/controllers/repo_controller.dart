import 'package:get/get.dart';
import 'package:github_explorer/domain/entities/repo.dart';
import 'package:github_explorer/domain/usecases/get_repo_usecase.dart';

enum RepoSort { name, updated, stars }

class RepoController extends GetxController {
  final GetRepoUseCase getRepoUseCase;

  RepoController(this.getRepoUseCase);
  final repos = <Repo>[].obs;
  final filtered = <Repo>[].obs;
  final isLoading = false.obs;
  final viewIsGrid = false.obs;
  final sortBy = RepoSort.updated.obs;
  final query = ''.obs;
  final error = ''.obs;
  String username = '';

  void init(String username) {
    this.username = username;
    loadRepos();
  }

  Future<void> loadRepos() async {
      isLoading.value = true;
      error.value = '';
      repos.clear();
      filtered.clear();
      final result = await getRepoUseCase.getRepo(username);
      result.fold(
            (f) => error.value = f.message,
            (repoList) {
          repos.assignAll(repoList);
          applyFilters();
        },
      );
      isLoading.value = false;
  }

  void toggleView() => viewIsGrid.value = !viewIsGrid.value;

  void setSort(RepoSort sort) {
    sortBy.value = sort;
    applyFilters();
  }

  void setQuery(String q) {
    query.value = q.trim();
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
