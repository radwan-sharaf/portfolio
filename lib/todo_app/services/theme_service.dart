import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices extends GetxController {
  // container
  final _box = GetStorage();

  final _key = 'isDark';

  _saveData(bool isDark) => _box.write(_key, isDark);
  bool _readThemeFromBox() => _box.read(_key) ?? false;
  ThemeMode get theme => _readThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  IconData get icon => _readThemeFromBox() ? Icons.dark_mode : Icons.light_mode;
  void switchTheme() {
    Get.changeThemeMode(_readThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveData(!_readThemeFromBox());
  }
}
