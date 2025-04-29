// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    required this.color,
    required this.textSize,
    this.isTitle = false,
    this.maxlines = 10,
  });
  final String text;
  final Color color;
  final double textSize;
  bool isTitle;
  int maxlines = 10;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: textSize,
        color: color,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
