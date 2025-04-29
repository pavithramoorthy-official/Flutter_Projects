import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/Auth/forget_password.dart';
import 'package:grocery_shopping/Auth/login_screen.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/fetech_screen.dart';
import 'package:grocery_shopping/screens/bottom_bar.dart';
import 'package:grocery_shopping/screens/loading_manager.dart';
import 'package:grocery_shopping/services/global_methods.dart';
//import 'package:grocery_shopping/services/utilities.dart';
import 'package:grocery_shopping/widgets/authentication_button.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const routeName = '/SignupScreen';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signupFormKey = GlobalKey<FormState>();

  final _fullNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  bool _hidePassword = true;

  bool _isLoading = false;
  bool _isFormErrorFree = false;

  void _signupForm() async {
    final isValid = _signupFormKey.currentState!.validate();
    _isFormErrorFree = isValid;
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    if (isValid) {
      _signupFormKey.currentState!.save;
      try {
        await firebaseAuthObject.createUserWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passwordTextController.text.trim());
        final User? user = firebaseAuthObject.currentUser;
        final _uid = user!.uid;
        user.updateDisplayName(_fullNameTextController.text);
        user.reload();

        await FirebaseFirestore.instance.collection("users").doc(_uid).set({
          'id': _uid,
          'name': _fullNameTextController.text,
          'email': _emailTextController.text.toLowerCase(),
          'shipping-address': _addressTextController.text,
          'userWishList': [],
          'userCartItems': [],
          'createdAt': Timestamp.now(),
        });
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const FetchScreen()));
        //print("Registered successfully");
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialogue(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        // ignore: use_build_context_synchronously
        GlobalMethods.errorDialogue(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _fullNameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _addressTextController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Color color = Utilities(context).color;
    return Scaffold(
      body: LoadingManager(
        isLoading: _isFormErrorFree && _isLoading,
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0.8),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Navigator.canPop(context)
                            ? Navigator.pop(context)
                            : null;
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextWidget(
                      text: "Welcome",
                      color: Colors.white,
                      textSize: 50,
                      isTitle: true,
                    ),
                    TextWidget(
                      text: "Signup to continue",
                      color: Colors.white,
                      textSize: 20,
                      isTitle: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _signupFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_emailFocusNode),
                            keyboardType: TextInputType.name,
                            controller: _fullNameTextController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This Field is missing";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Full name',
                              hintStyle: TextStyle(color: Colors.white54),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          //email
                          TextFormField(
                            focusNode: _emailFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailTextController,
                            validator: (value) {
                              if (value!.isEmpty || !value.contains("@")) {
                                return "Please enter a valid Email adress";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.white54),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          //password

                          TextFormField(
                            focusNode: _passwordFocusNode,
                            obscureText: _hidePassword,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordTextController,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 7) {
                                return "Please enter a valid password";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_addressFocusNode),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _hidePassword = !_hidePassword;
                                  });
                                },
                                child: Icon(
                                  _hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.white54),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            focusNode: _addressFocusNode,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: _signupForm,
                            controller: _addressTextController,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 10) {
                                return "Please enter a valid  address";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              hintText: 'Shipping address',
                              hintStyle: TextStyle(color: Colors.white54),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Forgot password

                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          GlobalMethods.navigateTo(
                              ctx: context,
                              routeName: ForgotPassword.routeName);
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            color: Colors.cyanAccent,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    AuthenticationButton(
                      fcn: () {
                        _signupForm();
                      },
                      buttonText: 'Register',
                    ),

                    const SizedBox(height: 10),
                    // already a user? Sign in

                    RichText(
                      text: TextSpan(
                        text: 'Already a user?',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: " Sign in",
                            style: const TextStyle(
                              color: Colors.cyanAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GlobalMethods.navigateTo(
                                    ctx: context,
                                    routeName: LoginScreen.routeName);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
