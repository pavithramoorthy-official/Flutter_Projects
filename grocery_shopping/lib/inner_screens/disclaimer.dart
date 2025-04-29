import 'package:flutter/material.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/back_widget.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';

class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({super.key});
  static const routeName = '/DisclaimerPage';

  @override
  Widget build(BuildContext context) {
    Color color = Utilities(context).color;
    Size size = Utilities(context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black87,
        title: const Text(
          "Disclaimer",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "The company is the sole creator of the application. It should be noted that the company bears no liability for the data uploaded onto the application, the application\'s content, or any financial transactions conducted through the application. The user data stored in the application is utilized by the app\'s client for order processing purposes only.It is important to note that data is not shared with any third party.",
              style: TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}




//