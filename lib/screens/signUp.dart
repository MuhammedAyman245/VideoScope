import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/regestration/Auth.dart';
import 'package:grad/screens/logIn.dart';
import 'package:grad/widgets/myTextField.dart';
import 'package:grad/screens/bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatefulWidget {
  static const String id = 'signUp';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name;
  String hint;
  String email;
  var pass;
  Auth auth = Auth();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 40),
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                              fontFamily: 'Cardo',
                              fontSize: 35,
                              color: Color(0xff0c2551),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 15),
                        child: MyTextFiled((value) {
                          setState(() {
                            name = value;
                          });
                        }, 'Name', 'Mohamed Ayman', TextInputType.text, false),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40, 15),
                        child: MyTextFiled((value) {
                          setState(() {
                            email = value;
                          });
                        }, 'Email', 'example.example@gmail.com',
                            TextInputType.emailAddress, false),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40, 15),
                        child: MyTextFiled((value) {
                          setState(() {
                            pass = value;
                          });
                        }, 'Password', '', TextInputType.emailAddress, true),
                      ),
                      Text(
                        'Create an account means you\'re okay with \n our terms of service and privacy policy',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff8f9db5).withOpacity(0.45)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40, 15),
                        child: Container(
                          height: 50.0,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xff0c2551),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton(
                            child: Center(
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                    color: Colors.grey[200],
                                    fontSize: 20.0,
                                    fontFamily: 'Cardo'),
                              ),
                            ),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              User user =
                                  await auth.SignUpWithEmail(email, pass, name);
                              if (user != null) {
                                Navigator.pushNamed(context, Home.id);
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?'),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SignIn.id);
                              },
                              child: Text('LogIn'))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
