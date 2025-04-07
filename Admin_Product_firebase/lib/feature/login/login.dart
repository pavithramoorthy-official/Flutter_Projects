import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:savings_admin/core/router/app_router.dart';
import 'package:savings_admin/core/router/app_router.gr.dart';
import 'package:savings_admin/ui_components/ui_button.dart';
import 'package:savings_admin/ui_components/ui_space.dart';
import 'package:savings_admin/ui_components/ui_text.dart';
import 'package:savings_admin/ui_components/ui_textfield.dart';
import 'package:savings_admin/ui_components/ui_textformfield.dart';
import 'package:crypto/crypto.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _showError = false;
  bool _buttonenabled = false;
  final FirebaseFirestore _auth = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Add listeners to the controllers
    usernameController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState(){
    if(usernameController.text.isNotEmpty &&  passwordController.text.isNotEmpty){
      setState(() {
        _buttonenabled = true;
      });
    }
  }

  void validateForm() async{
    setState(() {
      _showError = true;
    });



    if(_loginForm.currentState!.validate()){
      String uname = usernameController.text;
      String pword = passwordController.text;

      try{
        DocumentSnapshot<Map<String,dynamic>> authDoc = await _auth.collection("auth").doc("auth_admin").get();

      if(authDoc.exists){
        String username = authDoc.data()!['username'];
        String password = authDoc.data()!['password'];

        var pbytes = utf8.encode(pword);
        String pwordHash = sha256.convert(pbytes).toString();

        var  ubytes = utf8.encode(uname);
        String unameHash = sha256.convert(ubytes).toString();

        if(unameHash == username && pwordHash == password){
          context.router.replace(DashboardRoute());
        }
        else{
          _showLoginError();
        }
      }
      }catch (e){
        _showLoginError();
      }
    }
  }
  // Function to show login error message
  void _showLoginError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invalid username or password")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _loginForm,
      child: _buildForm(),
    ));
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiText(
            label: "Admin Login",
            fontSize: 30,
          ),
          UiSpace.vertical(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiText(label: "Username"),
              UiSpace.horizontal(10),
              SizedBox(
                width: 300,
                child: UiTextformfield(
                  controller: usernameController,
                  validator: (value){
                    if(_showError &&(value == null || value.isEmpty)){
                      return "please enter value";
                    }
                    return null;
                  },
                  // onChanged: (value){
                  //   _loginForm.currentState?.validate();
                  // },
                ),
              ),
            ],
          ),
          UiSpace.vertical(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiText(label: "Password"),
              UiSpace.horizontal(10),
              SizedBox(
                  width: 300,
                  child: UiTextformfield(
                    hideText: true,
                    controller: passwordController,
                    validator: (value){
                      if(_showError &&(value == null || value.isEmpty)){
                        return "please enter value";
                      }
                      return null;
                    },
                    // onChanged: (value){
                    // _loginForm.currentState?.validate();
                    // },
                  ),

              ),
            ],
          ),
          UiSpace.vertical(10),
          UiButton(label: "Submit", onTap: () {
            validateForm();
          },isEnabled: _buttonenabled,),
        ],
      ),
    );
  }
}
