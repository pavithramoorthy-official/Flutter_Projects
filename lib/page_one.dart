import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigation/router.dart';

@RoutePage()
class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
            children: [
          const Text(
            "Page One",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                context.router.push(const RouteTwo());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Change text color
              ),
              child: const Text(
                "Page Two",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 140,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(const FirstRoute());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Change text color
                  ),
                  child: const Text(
                    "Home Page",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
        ]),
      ),
    );

  }
}
