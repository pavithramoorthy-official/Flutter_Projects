import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  static const routeName = '/AboutUs';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Welcome to Grocery Shop, your trusted neighborhood grocery store! We are a family-owned business dedicated to providing our customers with the freshest produce, meats, dairy products, and other essentials at competitive prices.",
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
