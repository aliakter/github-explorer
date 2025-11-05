import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/app/controllers/theme_controller.dart';
import 'package:github_explorer/core/widgets/custom_loading_in.dart';
import 'package:github_explorer/presentation/controllers/user_controller.dart';

class LoginPage extends GetView<UserController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Explorer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'GitHub username'),
              onChanged: controller.setUsername,
              onSubmitted: (_) => controller.fetchUser(),
            ),
            const SizedBox(height: 12),
            Obx(
              () => controller.error.value == null
                  ? const SizedBox.shrink()
                  : Text(
                      controller.error.value!,
                      style: const TextStyle(color: Colors.red),
                    ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => SizedBox(
                width: 110,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.fetchUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeCtrl.isDark.value
                        ? Colors.white
                        : Colors.black,
                    foregroundColor: themeCtrl.isDark.value
                        ? Colors.black
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? CustomLoadingIn(
                          strokeWidth: 3,
                          height: 24,
                          width: 24,
                          color: themeCtrl.isDark.value
                              ? Colors.black
                              : Colors.white,
                        )
                      : Text(
                          'Continue',
                          style: TextStyle(
                            color: themeCtrl.isDark.value
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
