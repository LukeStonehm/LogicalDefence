import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('action_about'.tr),
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Text(
          'app_name'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.deepOrange
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 36, bottom: 36),
          child: Text(
            'creator'.tr,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        SelectableText(
          'about_more'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ]),
    );
  }
}
