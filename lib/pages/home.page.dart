import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logical_defence/controllers/controllers.dart';
import 'package:logical_defence/widgets/widgets.dart';

import '../shared/shared.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CategoryController _categoryController = Get.find();

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
              onSelected: (value) => _onSettingsPressed(value as String),
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
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Text(
                      'subtitle'.tr,
                      style: Theme.of(context).textTheme.headlineSmall,
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
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.only(bottom: 16),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(right: 80),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'sections_${_categoryController.selectedCategory.value}'.tr,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            ..._renderCards(_categoryController.selectedCategory.value)
          ],
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
                number: "${int.parse(key) + 1}")))
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

  void _onSettingsPressed(String setting) {
    print(setting);
    switch (setting) {
      case 'action_language':
        break;
      case 'action_theme':
        break;
      case 'action_about':
        Get.toNamed('/about');
        break;
    }
  }
}
