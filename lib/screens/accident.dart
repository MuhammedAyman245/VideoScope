import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/screens/quistions.dart';


class Accident extends StatefulWidget {
  static const String id = 'accident';
  @override
  _AccidentState createState() => _AccidentState();
}

class _AccidentState extends State<Accident> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0c2551),
            title: Center(
              child: Text('Accident and injuries',style: TextStyle(
                fontFamily: 'Cardo',
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w900
              ),),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Container(
                    height: 270,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: new AssetImage('images/accident.png'),
                      )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              TextButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return Questions();
                }));
              }, child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xff0c2551),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Center(
                  child: Text('Accident and injuries',style: TextStyle(
                      fontFamily: 'Cardo',
                    color: Colors.white,
                    fontSize: 19
                  ),),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
