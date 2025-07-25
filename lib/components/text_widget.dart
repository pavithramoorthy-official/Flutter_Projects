import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.label,
    this.textColor = Colors.indigo,
    this.textSize = 20,
    this.fontWeight = FontWeight.bold
  });

  String label;
  double textSize;
  Color textColor;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
    );
  }
}
