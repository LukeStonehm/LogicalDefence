import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logical_defence/controllers/controllers.dart';

import 'routes.dart';
import 'shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //set status bar transparent
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  //init get stuff here

  //put get controllers here
  Get.put<CategoryController>(CategoryController());

  runApp(MyApp(
    locale: Get.deviceLocale,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.locale}) : super(key: key);

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Logical Defence',
      translations: AppTranslations(),
      locale: locale,
      initialRoute: "/",
      getPages: AppRoutes.routes,
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.green,
          colorScheme: const ColorScheme.light()
              .copyWith(primary: Colors.green, secondary: Colors.white),
          scaffoldBackgroundColor: Colors.grey.shade300,
          cardTheme: const CardTheme().copyWith(
            color: Colors.grey.shade100,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          appBarTheme: const AppBarTheme().copyWith(
              elevation: 0,
              backgroundColor: Colors.grey.shade300,
              iconTheme: const IconThemeData().copyWith(color: Colors.black)),
          textTheme: const TextTheme().copyWith(
              headlineLarge: const TextStyle().copyWith(
                  color: Colors.grey.shade800, fontWeight: FontWeight.bold),
              titleLarge: const TextStyle()
                  .copyWith(fontSize: 20, color: Colors.deepOrange),
              labelSmall:
                  const TextStyle().copyWith(color: Colors.grey.shade400),
              bodyMedium: const TextStyle().copyWith(color: Colors.black))),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.green,
          colorScheme: const ColorScheme.dark()
              .copyWith(primary: Colors.green, secondary: Colors.white),
          scaffoldBackgroundColor: Colors.grey.shade900,
          cardTheme: const CardTheme().copyWith(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          appBarTheme: const AppBarTheme()
              .copyWith(elevation: 0, backgroundColor: Colors.grey.shade900),
          textTheme: const TextTheme().copyWith(
              titleLarge: const TextStyle()
                  .copyWith(fontSize: 20, color: Colors.deepOrange),
              labelSmall:
                  const TextStyle().copyWith(color: Colors.grey.shade400),
              bodyMedium: const TextStyle().copyWith(color: Colors.white))),
    );
  }
}
