import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/services/utilities.dart';
// import 'package:grocery_shopping/inner_screens/product_details.dart';
// import 'package:grocery_shopping/models/orders_model.dart';
// import 'package:grocery_shopping/providers/product_providers.dart';
// import 'package:grocery_shopping/services/global_methods.dart';
// import 'package:grocery_shopping/services/utilities.dart';
// import 'package:grocery_shopping/widgets/text_widget.dart';
// import 'package:provider/provider.dart';

// class OrderWidget extends StatefulWidget {
//   const OrderWidget({super.key});

//   @override
//   State<OrderWidget> createState() => _OrderWidgetState();
// }

// class _OrderWidgetState extends State<OrderWidget> {
//   late String orderDateToShow;
//   @override
//   void didChangeDependencies() {
//     final ordersModel = Provider.of<OrdersModel>(context);
//     var orderDate = ordersModel.orderDate.toDate();
//     orderDateToShow = '${orderDate.day}/${orderDate.month}/${orderDate.year}';
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ordersModel = Provider.of<OrdersModel>(context);
//     final productProviders = Provider.of<ProductProviders>(context);
//     final getCurrentProduct =
//         productProviders.findProductbyId(ordersModel.productId);
//     final Color color = Utilities(context).color;
//     Size size = Utilities(context).getScreenSize;
//     return ListTile(
//       subtitle: Text(
//           'Paid: Rs ${double.parse(ordersModel.price).toStringAsFixed(2)}'),
//       onTap: () {
//         GlobalMethods.navigateTo(
//             ctx: context, routeName: ProductDetails.routeName);
//       },
//       leading: FancyShimmerImage(
//         width: size.width * 0.2,
//         imageUrl: getCurrentProduct.imageUrl, //we can also use orders.imageUrl
//         boxFit: BoxFit.fill,
//       ),
//       title: TextWidget(
//           text: '${getCurrentProduct.title} X ${ordersModel.quantity}',
//           color: color,
//           textSize: 18),
//       trailing: TextWidget(text: orderDateToShow, color: color, textSize: 18),
//     );
//   }
// }

//mycode

//  class OrderWidget extends StatelessWidget {
//   final String orderId;
//   final String userId;
//   final List<dynamic> orderedProductsList;
//   final double totalPrice;
//   final String userName;
//   final String address;
//   final Timestamp orderDate;

//   const OrderWidget({
//     required this.orderId,
//     required this.userId,
//     required this.orderedProductsList,
//     required this.totalPrice,
//     required this.userName,
//     required this.address,
//     required this.orderDate,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = Utilities(context).getScreenSize;
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Order ID: $orderId',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               'User ID: $userId',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Total Price: $totalPrice',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               'User Name: $userName',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Address: $address',
//               style: const TextStyle(fontSize: 18),
//             ),
//             Text(
//               'Order Date: ${orderDate.toDate()}',
//               style: const TextStyle(fontSize: 18),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: orderedProductsList.length,
//               itemBuilder: (ctx, index) {
//                 final product = orderedProductsList[index];
//                 return ListTile(
//                   leading: FancyShimmerImage(
//                     width: size.width * 0.2,
//                     imageUrl: product['imageUrl'],
//                     boxFit: BoxFit.fill,
//                   ),
//                   title: Text(product['productName']),
//                   subtitle: Text('Quantity: ${product['quantity']}'),
//                   trailing: Text(product['price']),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//mycode

class OrderWidget extends StatelessWidget {
  final String orderId;
  final String userId;
  final List<dynamic> orderedProductsList;
  final double totalPrice;
  final String userName;
  final String address;
  final Timestamp orderDate;

  const OrderWidget({
    required this.orderId,
    required this.userId,
    required this.orderedProductsList,
    required this.totalPrice,
    required this.userName,
    required this.address,
    required this.orderDate,
  });

  @override
  Widget build(BuildContext context) {
    Size size = Utilities(context).getScreenSize;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Order Date: ${orderDate.toDate()}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Total Price: Rs $totalPrice',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderedProductsList.length,
              itemBuilder: (ctx, index) {
                final product = orderedProductsList[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        FancyShimmerImage(
                          width: 100,
                          height: 100,
                          imageUrl: product['imageUrl'],
                          boxFit: BoxFit.fill,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product['productName'],
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Price: ${product['price']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Quantity: ${product['quantity']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address : ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  address,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
