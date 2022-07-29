import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static const themes = {0: 'system', 1: 'light', 2: 'dark'};

  final selectedTheme = 0.obs;

  final _getBox = GetStorage();

  @override
  void onReady() {
    if (_getBox.hasData('selected_theme')) {
      selectedTheme.value = _getBox.read('selected_theme');
    }
    super.onReady();
  }

  void changeTheme(int theme) {
    _getBox.write('selected_theme', theme);
    switch (theme) {
      case 0:
        Get.changeThemeMode(ThemeMode.system);
        break;
      case 1:
        Get.changeThemeMode(ThemeMode.light);
        break;
      case 2:
        Get.changeThemeMode(ThemeMode.dark);
        break;
    }
    selectedTheme.value = theme;
  }
}
