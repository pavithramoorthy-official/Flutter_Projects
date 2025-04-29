//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/screens/bottom_bar.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.buttonText,
  });
  final String imagePath, title, subTitle, buttonText;

  @override
  Widget build(BuildContext context) {
    final Color color = Utilities(context).color;
    Size size = Utilities(context).getScreenSize;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 75,
                height: 75,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: subTitle,
                color: color,
                textSize: 25,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    side: const BorderSide(
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: BottomBarScreen.routeName);
                },
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
