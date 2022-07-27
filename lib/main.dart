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
      // todo sort out theme
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
          primaryColor: Colors.green,
          colorScheme: const ColorScheme.light()
              .copyWith(primary: Colors.green, secondary: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          cardTheme: const CardTheme().copyWith(
            color: Colors.green.shade100,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: Colors.green.shade200, width: 2)),
          ),
          appBarTheme: const AppBarTheme().copyWith(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData().copyWith(color: Colors.black)),
          textTheme: const TextTheme().copyWith(
              titleLarge:
                  const TextStyle().copyWith(fontSize: 20, color: Colors.green),
              bodyMedium: const TextStyle().copyWith(color: Colors.green))),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.green,
          colorScheme: const ColorScheme.dark()
              .copyWith(primary: Colors.green, secondary: Colors.white),
          scaffoldBackgroundColor: Colors.transparent,
          cardTheme: const CardTheme().copyWith(
            // color: Colors.green.shade100,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.white, width: 2)),
          ),
          appBarTheme: const AppBarTheme().copyWith(
            elevation: 0,
          ),
          textTheme: const TextTheme().copyWith(
              titleLarge:
                  const TextStyle().copyWith(fontSize: 20, color: Colors.white),
              bodyMedium: const TextStyle().copyWith(color: Colors.white))),
    );
  }
}
