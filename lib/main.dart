import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/app/bindings/initial_binding.dart';
import 'package:github_explorer/app/controllers/theme_controller.dart';
import 'package:github_explorer/app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeCtrl = Get.find();
    return Obx(() {
      return GetMaterialApp(
        title: 'GitHub Explorer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeCtrl.isDark.value ? ThemeMode.dark : ThemeMode.light,
        initialRoute: Routes.login,
        getPages: AppPages.pages,
      );
    });
  }
}