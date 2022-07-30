import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:logical_defence/controllers/controllers.dart';
import 'package:logical_defence/widgets/widgets.dart';

import '../shared/shared.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CategoryController _categoryController = Get.find();
  final LanguageController _languageController = Get.find();
  final ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'app_name'.tr,
          style: Theme.of(context).appBarTheme.titleTextStyle,
          overflow: TextOverflow.fade,
        ),
        actions: [
          PopupMenuButton(
              tooltip: 'action_settings'.tr,
              onSelected: (value) =>
                  _onSettingsPressed(context, value as String),
              itemBuilder: (BuildContext popupMenuContext) {
                return {'action_language', 'action_theme', 'action_about'}
                    .map((String choice) {
                  return PopupMenuItem(
                    value: choice,
                    child: Text(choice.tr),
                  );
                }).toList();
              }),
        ],
      ),
      drawer: Drawer(
        child: Obx(
          () => ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: Colors.deepOrange),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Text(
                        'app_name'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 28, color: Colors.white),
                      ),
                    ),
                    Text(
                      'subtitle'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              ..._renderDrawerCategories(
                  _categoryController.selectedCategory.value)
            ],
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: 1000,
          child: Obx(
            () => ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0).copyWith(right: 80),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'sections_${_categoryController.selectedCategory.value}'
                          .tr,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
                ..._renderCards(_categoryController.selectedCategory.value)
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<FallacyCard> _renderCards(String selectedCategory) {
    return FallacyDataStructure
        .fallaciesStructure['fallacies']!['titles']![selectedCategory]!
        .map((key, value) => MapEntry(
            key,
            FallacyCard(
              header: 'fallacies_titles_${selectedCategory}_$key'.tr,
              body: 'fallacies_descs_${selectedCategory}_$key'.tr,
              example: 'fallacies_examples_${selectedCategory}_$key'.tr,
              number: "${int.parse(key) + 1}",
              onLongPressed: () => _shareFallacy(
                  'fallacies_titles_${selectedCategory}_$key'.tr,
                  'fallacies_descs_${selectedCategory}_$key'.tr,
                  'fallacies_examples_${selectedCategory}_$key'.tr),
            )))
        .values
        .toList();
  }

  List<ListTile> _renderDrawerCategories(String selectedCategory) {
    return FallacyDataStructure.sectionsStructure['sections']!
        .map((key, value) => MapEntry(
            key,
            ListTile(
              title: Text(
                'sections_$key'.tr,
                style: TextStyle(
                    fontSize: 16,
                    color: selectedCategory == key
                        ? Colors.deepOrange
                        : Get.isDarkMode
                            ? Colors.grey.shade400
                            : Colors.grey.shade800),
              ),
              onTap: () => _onCategoryPressed(key),
            )))
        .values
        .toList();
  }

  void _onCategoryPressed(String category) {
    _categoryController.selectedCategory.value = category;
  }

  void _onSettingsPressed(BuildContext context, String setting) {
    switch (setting) {
      case 'action_language':
        _showLanguageBottomSheet(context);
        break;
      case 'action_theme':
        _showThemeBottomSheet(context);
        break;
      case 'action_about':
        Get.toNamed('/about');
        break;
    }
  }

  void _showLanguageBottomSheet(BuildContext context) {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4))),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 8),
            child: Text(
              'language_dialog_title'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 24, fontWeight: FontWeight.normal),
            ),
          ),
          ...FallacyDataStructure.localeStructure['locales']!['names']!
              .map((key, value) => MapEntry(
                  key,
                  ListTile(
                    leading: Obx(
                      () => Radio(
                        activeColor: Colors.deepOrange,
                        value: key,
                        groupValue: _languageController.selectedLocale.value,
                        onChanged: (value) {
                          _languageController.changeLocale(value as String);
                        },
                      ),
                    ),
                    onTap: () => _languageController.changeLocale(key),
                    title: Text('locale_name_$key'.tr),
                  )))
              .values
              .toList(),
        ],
      ),
    ));
  }

  void _showThemeBottomSheet(BuildContext context) {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4))),
      child: ListView(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 8),
            child: Text(
              'action_theme'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 24, fontWeight: FontWeight.normal),
            ),
          ),
          ...ThemeController.themes
              .map((key, value) => MapEntry(
                  key,
                  ListTile(
                    leading: Obx(
                      () => Radio(
                        activeColor: Colors.deepOrange,
                        value: key,
                        groupValue: _themeController.selectedTheme.value,
                        onChanged: (value) {
                          _themeController.changeTheme(value as int);
                        },
                      ),
                    ),
                    onTap: () => _themeController.changeTheme(key),
                    title: Text('theme_name_$key'.tr,
                        style: Theme.of(context).textTheme.titleMedium),
                  )))
              .values
              .toList(),
        ],
      ),
    ));
  }

  _shareFallacy(String title, String desc, String example) async {
    final shareString = "$title\n\n$desc\n\n$example${'from'.tr}";
    await FlutterShare.share(
        title: 'share'.tr, chooserTitle: 'share'.tr, text: shareString);
  }
}
