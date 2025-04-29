//import 'dart:math';

// ignore_for_file: use_build_context_synchronously

import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shopping/Auth/forget_password.dart';
import 'package:grocery_shopping/Auth/signup.dart';
import 'package:grocery_shopping/constants/const_lists.dart';
import 'package:grocery_shopping/constants/firebase_consts.dart';
import 'package:grocery_shopping/fetech_screen.dart';
import 'package:grocery_shopping/screens/bottom_bar.dart';
import 'package:grocery_shopping/screens/loading_manager.dart';
import 'package:grocery_shopping/services/global_methods.dart';
import 'package:grocery_shopping/widgets/authentication_button.dart';
import 'package:grocery_shopping/widgets/google_button.dart';
import 'package:grocery_shopping/widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  bool _hidePassword = false;
  bool _isFormErrorFree = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  void _submitLoginForm() async {
    final isValid = _loginFormKey.currentState!.validate();
    _isFormErrorFree = isValid;
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    if (isValid) {
      _loginFormKey.currentState!.save;
      try {
        await firebaseAuthObject.signInWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passwordTextController.text.trim());
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const BottomBarScreen()));
        //print("Registered successfully");
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialogue(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingManager(
        isLoading: _isFormErrorFree && _isLoading,
        child: Stack(
          children: [
            Swiper(
              duration: 800,
              autoplayDelay: 6000,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  ConstList.offerImages[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: ConstList.offerImages.length,
              //control: SwiperControl(color: Colors.black), ==> display this >
            ),
            Container(
              color: Colors.black.withOpacity(0.7),
            ),
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  TextWidget(
                    text: "Welcome",
                    color: Colors.white,
                    textSize: 50,
                    isTitle: true,
                  ),
                  TextWidget(
                    text: "Signin to continue",
                    color: Colors.white,
                    textSize: 20,
                    isTitle: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                          controller: _emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          //value is variable name. this will be called
                          //while validating form => _loginFormKey.currentState!.validate();
                          validator: (value) {
                            if (value!.isEmpty ||
                                !value.contains('@') ||
                                !value.contains('.com')) {
                              return 'Please enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            helperStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white70,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        //Password

                        TextFormField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () {
                            _submitLoginForm();
                          },
                          controller: _passwordTextController,
                          focusNode: _passwordFocusNode,
                          obscureText:
                              !_hidePassword, // display password as * or dot
                          keyboardType: TextInputType.visiblePassword,

                          //value is variable name. this will be called
                          //while validating form => _loginFormKey.currentState!.validate();
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Please enter a valid password';
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(color: Colors.white),
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
                            helperStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white70,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            errorStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
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
                            ctx: context, routeName: ForgotPassword.routeName);
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
                      _submitLoginForm();
                    },
                    buttonText: 'Login',
                  ),
                  const SizedBox(height: 10),
                  //Google button
                  const GoogleButton(),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Divider(color: Colors.white, thickness: 2)),
                      const SizedBox(width: 10),
                      TextWidget(text: 'OR', color: Colors.white, textSize: 18),
                      const SizedBox(width: 10),
                      const Expanded(
                          child: Divider(color: Colors.white, thickness: 2)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AuthenticationButton(
                    fcn: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const FetchScreen()));
                    },
                    buttonText: 'Continue as guest',
                    backgroundColor: Colors.pink.shade400,
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: " Sign up",
                          style: const TextStyle(
                            color: Colors.cyanAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              GlobalMethods.navigateTo(
                                  ctx: context, routeName: SignUp.routeName);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
