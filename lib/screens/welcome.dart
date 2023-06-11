import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/screens/logIn.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.png'),
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 150.0,),
                Center(
                  child: Text(
                      'Welcome To VideoScope',
                    style:
                    TextStyle(
                        color: Color(0xff0c2551),
                        fontSize: 30.0,
                        fontFamily: 'Cardo'
                    ),
                  ),
                ),
                SizedBox(height: 300.0,),
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff0c2551),
                    borderRadius: BorderRadius.circular(50.00),
                  ),
                  child: TextButton(
                    child: Text('Get Started',
                      style:
                      TextStyle(
                          color: Colors.grey[100],
                          fontSize: 20.0,
                          fontFamily: 'Cardo'
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, SignIn.id);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
