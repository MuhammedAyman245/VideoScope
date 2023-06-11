import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/regestration/Auth.dart';
import 'package:grad/screens/signUp.dart';
import 'package:grad/widgets/myTextField.dart';
import 'package:grad/screens/bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignIn extends StatefulWidget {
  static const String id = 'signIn';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String name;
  String hint;
  String email;
  var pass;
  bool isLoading = false;
  Auth auth = Auth();
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
                          'SignIn',
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(40.0, 30.0, 40, 30),
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
                                'SignIn',
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
                              User user = await auth.signInwithEmail(
                                  email.trim(), pass);
                              if (user != null) {
                                Navigator.pushNamed(context, Home.id);
                                setState(() {
                                  isLoading = false;
                                });
                              } else {}
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account !'),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Register.id);
                              },
                              child: Text('SignUp'))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        height: 55.0,
                        width: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.google,
                                  size: 20, color: Color(0xff0c2551)),
                              SizedBox(width: 8.0),
                              Text('Sign In With Google',
                                  style: TextStyle(
                                      fontFamily: 'Cardo',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Home.id);
                          },
                        ),
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
