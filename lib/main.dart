import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logical_defence/shared/app_translations.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //set status bar transparent
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  //init get stuff here

  //put get controllers here

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
        themeMode: ThemeMode.dark,
        translations: AppTranslations(),
        locale: locale,
        initialRoute: "/",
        getPages: AppRoutes.routes,
        // todo sort out theme
        theme: ThemeData(
            // colorScheme: const ColorScheme.dark(
            //   primary: Colors.white,
            //   secondary: Colors.white,
            // ),
            // primaryIconTheme: IconTheme.of(context).copyWith(color: Colors.white),
            // iconTheme: IconTheme.of(context).copyWith(color: Colors.white),
            // buttonTheme: ButtonThemeData(
            //     colorScheme: const ColorScheme.dark(
            //         primary: Colors.black, secondary: Colors.white),
            //     shape: RoundedRectangleBorder(
            //         side: const BorderSide(
            //             width: 1, color: Color.fromRGBO(255, 255, 255, 0.2)),
            //         borderRadius: BorderRadius.circular(4))),
            // inputDecorationTheme: const InputDecorationTheme(
            //     contentPadding: EdgeInsets.zero,
            //     floatingLabelBehavior: FloatingLabelBehavior.never,
            //     enabledBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey)),
            //     focusedBorder: UnderlineInputBorder(
            //         borderSide: BorderSide(color: Colors.white)),
            //     focusColor: Colors.white,
            //     labelStyle: TextStyle(color: Colors.grey)),
            // textSelectionTheme:
            //     const TextSelectionThemeData(cursorColor: Colors.white),
            // textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
            // scaffoldBackgroundColor: const Color.fromRGBO(34, 37, 43, 1)
            ));
  }
}
