import 'package:flutter/material.dart';
import 'package:logical_defence/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Logical Defence',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      drawer: Text('test'),
      body: ListView(
        /*
        Appeal to Anonymous Authority

Using evidence from an unnamed 'expert' or 'study' or generalized group (like 'scientists') to claim something is true.

'They say that it takes 7 years to digest chewing gum.'

Shared From Logical Defence Application
         */
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(right: 80),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Appeal to the mind',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          const FallacyCard(
              header: 'Appeal to Anonymous Authority',
              body:
                  "Using evidence from an unnamed 'expert' or 'study' or generalized group (like 'scientists') to claim something is true.",
              example:
                  "'They say that it takes 7 years to digest chewing gum.'",
              number: "01"),
        ],
      ),
    );
  }
}
