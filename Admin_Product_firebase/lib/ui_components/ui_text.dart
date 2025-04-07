import 'package:flutter/material.dart';

class UiText extends StatelessWidget {
  const UiText({
    super.key,
    required this.label,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  });

  final String label;
  final Color? fontColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize ?? 20,
        color: fontColor ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.bold
      ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
