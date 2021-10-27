import 'package:flutter/material.dart';

class ErrorLabel extends StatelessWidget {
  final String name;
  final String text;

  final TextStyle descriptionStyle;

  ErrorLabel(
    this.name,
    String? error, {
    Key? key,
    double fontSize = 9.0,
    bool isBold = false,
  })  : text = error ?? 'Unknown $name',
        descriptionStyle = TextStyle(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: error == null ? Colors.red : Colors.black,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: descriptionStyle);
  }
}
