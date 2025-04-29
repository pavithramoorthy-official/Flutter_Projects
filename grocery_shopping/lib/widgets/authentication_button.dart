import 'package:flutter/material.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    super.key,
    required this.fcn,
    required this.buttonText,
    this.backgroundColor = Colors.white38,
  });
  final Function fcn;
  final String buttonText;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          fcn();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: TextWidget(
          text: buttonText,
          color: Colors.white,
          textSize: 18,
          isTitle: true,
        ),
      ),
    );
  }
}
