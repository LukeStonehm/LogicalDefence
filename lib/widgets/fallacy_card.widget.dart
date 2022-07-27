import 'package:flutter/material.dart';

class FallacyCard extends StatelessWidget {
  const FallacyCard(
      {Key? key,
      required this.header,
      required this.body,
      required this.example})
      : super(key: key);

  final String header;
  final String body;
  final String example;

  // padding
  static const _columnPadding = EdgeInsets.all(0);
  static const _cardPadding = EdgeInsets.all(8.0);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: _columnPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _cardPadding,
              child: Text(
                header,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: _cardPadding,
              child: Text(
                body,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: _cardPadding,
              child: Text(example,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontStyle: FontStyle.italic)),
            )
          ],
        ),
      ),
    );
  }
}
