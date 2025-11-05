import 'package:get/get.dart';
import 'package:github_explorer/domain/entities/user.dart';
import 'package:github_explorer/domain/usecases/get_user_usecase.dart';
import 'package:github_explorer/presentation/controllers/repo_controller.dart';

class UserController extends GetxController {
  final GetUserUseCase getUserUseCase;

  UserController(this.getUserUseCase);

  final user = Rxn<User>();
  final isLoading = false.obs;
  final error = RxnString();
  final username = ''.obs;

  void setUsername(String value) => username.value = value.trim();

  Future<void> fetchUser() async {
    final name = username.value;
    if (name.isEmpty) {
      error.value = 'Please enter username';
      return;
    }

    isLoading.value = true;
    error.value = null;
    user.value = null;
    final repoCtrl = Get.find<RepoController>();
    repoCtrl.repos.clear();
    repoCtrl.filtered.clear();
    final result = await getUserUseCase.getUser(name);
    result.fold(
          (f) => error.value = f.message,
          (u) {
        user.value = u;
        Get.toNamed('/home');
      },
    );
    isLoading.value = false;
  }
}
