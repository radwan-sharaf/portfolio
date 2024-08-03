import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_t_app/todo_app/services/theme_service.dart';
import 'package:todo_t_app/todo_app/ui/layout/home_layout/home_layout.dart';
import 'package:todo_t_app/todo_app/ui/pages/splash/splash_screen.dart';
import 'package:todo_t_app/todo_app/ui/style/design/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  ThemeServices themeCtrl = Get.put(ThemeServices());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: Themes.light_theme,
      darkTheme: Themes.dark_theme,
      themeMode: themeCtrl.theme,
      home: SplashScreen(),
    );
  }
}


