import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:github_explorer/presentation/pages/home/home_page.dart';
import 'package:github_explorer/presentation/pages/login/login_page.dart';
import 'package:github_explorer/presentation/pages/repo_details/repo_details_page.dart';

class Routes {
  static const login = '/';
  static const home = '/home';
  static const details = '/details';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.login, page: () => const LoginPage()),
    GetPage(name: Routes.home, page: () => const HomePage()),
    GetPage(name: Routes.details, page: () => const RepoDetailsPage()),
  ];
}