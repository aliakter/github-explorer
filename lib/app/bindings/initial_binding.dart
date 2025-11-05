import 'package:get/get.dart';
import 'package:github_explorer/app/controllers/theme_controller.dart';
import 'package:github_explorer/core/network/dio_client.dart';
import 'package:github_explorer/data/data_sources/repo_remote_data_source.dart';
import 'package:github_explorer/data/data_sources/user_remote_data_source.dart';
import 'package:github_explorer/data/repositories/repo_repository_impl.dart';
import 'package:github_explorer/data/repositories/user_repository_impl.dart';
import 'package:github_explorer/domain/repositories/repo_repository.dart';
import 'package:github_explorer/domain/repositories/user_repository.dart';
import 'package:github_explorer/domain/usecases/get_repo_usecase.dart';
import 'package:github_explorer/domain/usecases/get_user_usecase.dart';
import 'package:github_explorer/presentation/controllers/repo_controller.dart';
import 'package:github_explorer/presentation/controllers/user_controller.dart';

class InitialBinding {
  void dependencies() {
    Get.put(ThemeController());
    Get.lazyPut(() => DioClient());
    Get.lazyPut<UserRemoteDataSource>(() => UserRemoteDataSource(Get.find()));
    Get.lazyPut<RepoRemoteDataSource>(() => RepoRemoteDataSource(Get.find()));
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find()));
    Get.lazyPut<RepoRepository>(() => RepoRepositoryImpl(Get.find()));
    Get.lazyPut(() => GetUserUseCase(Get.find()));
    Get.lazyPut(() => GetRepoUseCase(Get.find()));
    Get.put(UserController(Get.find()));
    Get.put(RepoController(Get.find()));
  }
}
