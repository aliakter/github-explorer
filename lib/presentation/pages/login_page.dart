import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_explorer/presentation/controllers/user_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController ctrl = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('GitHub Explorer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'GitHub username'),
              onChanged: ctrl.setUsername,
              onSubmitted: (_) => ctrl.fetchUser(),
            ),
            const SizedBox(height: 12),
            Obx(() => ctrl.error.value == null
                ? const SizedBox.shrink()
                : Text(ctrl.error.value!, style: const TextStyle(color: Colors.red)),
            ),
            const SizedBox(height: 12),
            Obx(
              () => ElevatedButton(
                onPressed: ctrl.isLoading.value ? null : ctrl.fetchUser,
                child: ctrl.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
