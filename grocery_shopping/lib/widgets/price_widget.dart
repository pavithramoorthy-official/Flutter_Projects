import 'package:flutter/material.dart';
//import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.onSalePrice,
    required this.price,
    required this.textPrice,
    required this.isOnSale,
  });
  final double onSalePrice, price;
  final String textPrice;
  final bool isOnSale;

  @override
  Widget build(BuildContext context) {
    //final utilities = Utilities(context);
    //Color color = utilities.color;
    double userPrice = isOnSale ? onSalePrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: "Rs ${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}",
            color: Colors.green,
            textSize: 17,
            isTitle: true,
          ),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              "Rs ${(price * int.parse(textPrice)).toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 14,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
