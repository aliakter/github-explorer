import 'package:get/get.dart';
import 'package:github_explorer/app/controllers/theme_controller.dart';
import 'package:github_explorer/core/network/dio_client.dart';
import 'package:github_explorer/data/data_sources/github_remote_data_source.dart';
import 'package:github_explorer/data/repositories/github_repository_impl.dart';
import 'package:github_explorer/domain/repositories/github_repository.dart';
import 'package:github_explorer/presentation/controllers/repo_controller.dart';
import 'package:github_explorer/presentation/controllers/user_controller.dart';

class InitialBinding {
  void dependencies() {
    // Controllers
    Get.put(ThemeController());

    // Data sources and repositories
    Get.lazyPut(() => DioClient());
    Get.lazyPut<GitHubRemoteDataSource>(() => GitHubRemoteDataSource(Get.find()));
    Get.lazyPut<GitHubRepository>(() => GitHubRepositoryImpl(Get.find()));

    // Use controllers
    Get.put(UserController(Get.find()));
    Get.put(RepoController(Get.find()));
  }
}
