import 'package:get/get.dart';

class LanguageController extends GetxController {
  final selectedLocale = ''.obs;

  @override
  void onReady(){
    // todo read storage

    super.onReady();
  }

  changeLocale(String locale) {
    print(locale);
    // todo write storage
  }
}
