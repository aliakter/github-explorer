import 'package:get/get.dart';

class ThemeController extends GetxController {
  final isDark = false.obs;
  void toggle() => isDark.value = !isDark.value;
}