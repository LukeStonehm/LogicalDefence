import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final selectedLocale = ''.obs;

  final _getBox = GetStorage();

  @override
  void onReady() {
    if (_getBox.hasData('selected_language')) {
      selectedLocale.value = _getBox.read('selected_language');
    } else {
      selectedLocale.value =
          '${Get.deviceLocale?.languageCode}_${Get.deviceLocale?.countryCode}';
    }
    super.onReady();
  }

  changeLocale(String locale) async {
    final splitLocale = locale.split('_');
    Get.updateLocale(Locale(splitLocale[0], splitLocale[1]));
    await _getBox.write('selected_language', locale);
    selectedLocale.value = locale;
  }
}
