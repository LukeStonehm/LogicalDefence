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

  // text styles
  static const _headerTextStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: _columnPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _cardPadding,
              child: Text(
                header,
                style: _headerTextStyle,
              ),
            ),
            Padding(
              padding: _cardPadding,
              child: Text(body),
            ),
            Padding(
              padding: _cardPadding,
              child: Text(example),
            )
          ],
        ),
      ),
    );
  }
}
