import 'package:flutter/material.dart';

class UiButton extends StatelessWidget {
  const UiButton({
    super.key,
    this.borderCurve,
    required this.label,
    required this.onTap,
    this.buttonColor,
    this.buttonOutlineColor,
    this.isEnabled = false,

  });

  final BorderRadius? borderCurve;
  final String label;
  final Color? buttonColor;
  final Color? buttonOutlineColor;
  final GestureTapCallback onTap;
  final bool isEnabled;


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      color: Colors.transparent,
      borderRadius: borderCurve ?? BorderRadius.circular(12),
      child: InkWell(
        splashColor: Colors.white,
        onTap: isEnabled ? onTap : null,
        borderRadius: borderCurve ?? BorderRadius.circular(12),

        child:Padding(padding: EdgeInsets.all(1),
        child:  Container(

          decoration: BoxDecoration(
            color: isEnabled ? Colors.purple.shade50 : Colors.grey.shade400,
            border: Border.all(
              color: isEnabled ?  buttonOutlineColor ?? Colors.purple : Colors.grey.shade300,
            ),
            borderRadius: borderCurve ?? BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          ),
        ),
        ),
      ),
    );


  }
}
