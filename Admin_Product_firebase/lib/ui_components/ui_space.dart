import 'package:flutter/cupertino.dart';

class UiSpace extends StatelessWidget {
  const UiSpace({super.key,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;

  const UiSpace.horizontal(this.width, {super.key}):height = null;
  const UiSpace.vertical(this.height,{super.key}) : width = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
