import 'package:flutter/material.dart';
import 'package:grocery_shopping/services/utilities.dart';

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({
    super.key,
    required this.textForEmptyScreen,
  });
  final String textForEmptyScreen;

  @override
  Widget build(BuildContext context) {
    Color color = Utilities(context).color;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 45),
            SizedBox(
              height: 30,
              width: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/offers/emptybox.jpeg'),
              ),
            ),
            Text(
              textForEmptyScreen,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
