import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_shopping/services/utilities.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Utilities(context).color;
    //Size size = Utilities(context).getScreenSize;
    return InkWell(
      borderRadius: BorderRadius.circular(
        12,
      ),
      onTap: () {
        Navigator.pop(context);
        // GlobalMethods.navigateTo(
        //     ctx: context, routeName: BottomBarScreen.routeName);
      },
      child: Icon(
        IconlyLight.arrowLeft2,
        color: color,
      ),
    );
  }
}
