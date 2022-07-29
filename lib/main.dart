import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logical_defence/controllers/controllers.dart';

import 'routes.dart';
import 'shared/shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //set status bar transparent
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  //init Get stuff here
  await GetStorage.init();

  //put Get controllers here
  Get.put<CategoryController>(CategoryController());
  Get.put<LanguageController>(LanguageController());

  runApp(MyApp(
    locale: Get.deviceLocale, //todo change back
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
          primaryColor: Colors.deepOrange,
          colorScheme: const ColorScheme.light()
              .copyWith(primary: Colors.deepOrange, secondary: Colors.grey),
          scaffoldBackgroundColor: Colors.grey.shade300,
          cardTheme: const CardTheme().copyWith(
            color: Colors.grey.shade100,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          popupMenuTheme: PopupMenuTheme.of(context).copyWith(
              color: Colors.grey.shade300,
              textStyle: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          appBarTheme: const AppBarTheme().copyWith(
              elevation: 0,
              backgroundColor: Colors.grey.shade300,
              iconTheme: const IconThemeData().copyWith(color: Colors.black),
              titleTextStyle: const TextStyle().copyWith(
                  color: Colors.grey.shade800,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          textTheme: const TextTheme().copyWith(
              headlineLarge: const TextStyle().copyWith(
                  color: Colors.grey.shade800, fontWeight: FontWeight.bold),
              titleLarge: const TextStyle()
                  .copyWith(fontSize: 24, color: Colors.deepOrange),
              labelSmall:
                  const TextStyle().copyWith(color: Colors.grey.shade500),
              bodyMedium: const TextStyle()
                  .copyWith(color: Colors.black, fontSize: 16)),
          drawerTheme: DrawerTheme.of(context).copyWith(
            backgroundColor: Colors.grey.shade300,
          ),
          listTileTheme: ListTileTheme.of(context)
              .copyWith(textColor: Colors.grey.shade800)),

      // dark theme
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.deepOrange,
          colorScheme: const ColorScheme.dark()
              .copyWith(primary: Colors.deepOrange, secondary: Colors.white),
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
                  .copyWith(fontSize: 24, color: Colors.deepOrange),
              labelSmall:
                  const TextStyle().copyWith(color: Colors.grey.shade400),
              bodyMedium: const TextStyle()
                  .copyWith(color: Colors.white, fontSize: 16))),
    );
  }
}
