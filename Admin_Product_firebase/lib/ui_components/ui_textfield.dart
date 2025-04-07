import 'package:flutter/material.dart';

import '../core/styles/colorscheme/colors/app_colors.dart';

class UiTextfield extends StatefulWidget {
  const UiTextfield({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<UiTextfield> createState() => _UiTextfieldState();
}

class _UiTextfieldState extends State<UiTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(

      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: DefaultColors.gray_0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DefaultColors.red_2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DefaultColors.purple_8,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DefaultColors.purple_8,
          ),
        ),
      ),
    );
  }
}
