import 'package:get/get.dart';

import 'pages/pages.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/about', page: () => const AboutPage()),
  ];
}
