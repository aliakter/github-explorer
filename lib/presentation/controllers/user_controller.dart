import 'package:get/get.dart';
import 'package:github_explorer/domain/entities/user.dart';
import 'package:github_explorer/domain/repositories/github_repository.dart';
import 'package:github_explorer/presentation/controllers/repo_controller.dart';

class UserController extends GetxController {
  final GitHubRepository _repo;
  UserController(this._repo);

  final username = ''.obs;
  final isLoading = false.obs;
  final user = Rxn<User>();
  final error = RxnString();

  void setUsername(String v) => username.value = v.trim();

  Future<void> fetchUser() async {
    final name = username.value;
    if (name.isEmpty) {
      error.value = 'Please enter username';
      return;
    }
    try {
      isLoading.value = true;
      error.value = null;

      // clear previous user & repo data
      user.value = null;
      final repoCtrl = Get.find<RepoController>();
      repoCtrl.repos.clear();
      repoCtrl.filtered.clear();

      final u = await _repo.getUser(name);
      user.value = u;
      Get.toNamed('/home');
    } catch (e) {
      error.value = 'User not found or network error.';
    } finally {
      isLoading.value = false;
    }
  }
}