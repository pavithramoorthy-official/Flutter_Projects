import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/fetech_screen.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  Future<void> _googleSignIn(context) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await firebaseAuthObject.signInWithCredential(credential);
    //print(userCredential.user?.displayName);
    if (userCredential.user != null) {
      if (userCredential.additionalUserInfo!.isNewUser) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set({
          'id': userCredential.user!.uid,
          'name': userCredential.user!.displayName,
          'email': userCredential.user!.email,
          'shipping-address': '',
          'userWishList': [],
          'userCartItems': [],
          'createdAt': Timestamp.now(),
        });
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const FetchScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 7, 131, 233),
      child: InkWell(
        onTap: () {
          _googleSignIn(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Image.asset(
                'assets/images/google.png', //assets\images\google.png
                width: 40.0,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TextWidget(
              text: 'Sign in with Google',
              color: Colors.white,
              textSize: 18,
            )
          ],
        ),
      ),
    );
  }
}
