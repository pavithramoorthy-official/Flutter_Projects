import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigation/router.dart';

@RoutePage()
class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

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
                "Page Two",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    context.router.push(RouteOne());
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Change text color
                  ),
                  child: const Text(
                    "Page One",
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
