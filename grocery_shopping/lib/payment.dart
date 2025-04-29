import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('groceryShopAdmin')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.monetization_on,
                  size: 100,
                  weight: 50,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "G Pay / Phone Pe",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  snapshot.data!.docs[0]['mobileNumber'],
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Send Payment Screenshot to ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data!.docs[0]['mobileNumber'],
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurpleAccent),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      "(whatsapp) ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
