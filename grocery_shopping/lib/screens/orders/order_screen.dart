// // ignore_for_file: no_leading_underscores_for_local_identifiers, dead_code

//import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/providers/orders_providers.dart';
import 'package:grocery_shopping/screens/orders/order_widget.dart';
import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/back_widget.dart';
import 'package:grocery_shopping/widgets/empty_cart.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';
import 'package:provider/provider.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({super.key});
//   static const routeName = '/OrderScreen';

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final Color color = Utilities(context).color;
//     //Size size = Utilities(context).getScreenSize;
//     bool _isEmpty = true;
//     final ordersProviders = Provider.of<OrdersProviders>(context);
//     final ordersList = ordersProviders.getOrders;

//     return FutureBuilder(
//         future: ordersProviders.fetchOrderFromFirebase(),
//         builder: ((context, snapshot) {
//           return ordersList.isEmpty
//               ? const EmptyScreen(
//                   imagePath: 'assets/images/offers/emptybox.jpeg',
//                   title: 'You are yet to place an Order!!',
//                   subTitle: 'Now is the Right time to Order!!!',
//                   buttonText: 'Shop Now',
//                 )
//               : Scaffold(
//                   appBar: AppBar(
//                     leading: const BackWidget(),
//                     elevation: 0,
//                     centerTitle: false,
//                     title: TextWidget(
//                       text: 'Your orders (${ordersList.length})',
//                       color: color,
//                       textSize: 24.0,
//                       isTitle: true,
//                     ),
//                     backgroundColor: Theme.of(context)
//                         .scaffoldBackgroundColor
//                         .withOpacity(0.9),
//                   ),
//                   body: ListView.separated(
//                     itemCount: ordersList.length,
//                     itemBuilder: (ctx, index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 2, vertical: 6),
//                         child: ChangeNotifierProvider.value(
//                           value: ordersList[index],
//                           child: const OrderWidget(),
//                         ),
//                       );
//                     },
//                     separatorBuilder: (BuildContext context, int index) {
//                       return Divider(
//                         color: color,
//                         thickness: 1,
//                       );
//                     },
//                   ),
//                 );
//         }));
//   }
// }

// mycode

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  static const routeName = '/OrderScreen';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utilities(context).color;
    final userId = firebaseAuthObject.currentUser!.uid;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('ordersLists')
          .where('userId', isEqualTo: userId)
          .orderBy('orderDate', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final ordersList = snapshot.data!.docs;

          return ordersList.isEmpty
              ? const EmptyScreen(
                  imagePath: 'assets/images/offers/emptybox.jpeg',
                  title: 'No Order available!',
                  subTitle: 'Right time to Order Now!!!',
                  buttonText: 'Shop Now',
                )
              : Scaffold(
                  appBar: AppBar(
                    leading: const BackWidget(),
                    elevation: 0,
                    centerTitle: false,
                    title: TextWidget(
                      text: 'Your orders (${ordersList.length})',
                      color: color,
                      textSize: 24.0,
                      isTitle: true,
                    ),
                    backgroundColor: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.9),
                  ),
                  body: ListView.builder(
                    itemCount: ordersList.length,
                    itemBuilder: (ctx, index) {
                      final order = ordersList[index];
                      return OrderWidget(
                        orderId: order['orderId'],
                        userId: order['userId'],
                        orderedProductsList: order['orderedProductsList'],
                        totalPrice: order['totalPrice'],
                        userName: order['userName'],
                        address: order['address'],
                        orderDate: order['orderDate'],
                      );
                    },
                  ),
                );
        } else {
          return const EmptyScreen(
            imagePath: 'assets/images/offers/emptybox.jpeg',
            title: 'No Order available!',
            subTitle: 'Right time to Order Now!!!',
            buttonText: 'Shop Now',
          );
        }
      },
    );
  }
}





//mycode