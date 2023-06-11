import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/screens/bleeding.dart';
import 'package:grad/screens/breath.dart';
import 'package:grad/screens/burn.dart';
import 'package:grad/screens/dizzy.dart';
import 'package:grad/screens/faint.dart';
import 'package:grad/screens/heartAttack.dart';
import 'package:grad/screens/bar.dart';
import 'package:grad/widgets/myContainer.dart';
import 'package:url_launcher/url_launcher.dart';


class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  void customlaunch(command) async{
    if( await canLaunch(command)){
      await launch(command);
    }else{
      print('error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: ListView(
            children: [
              Row(
                children: [
                  SizedBox(width: 12,),
                  IconButton(icon: Icon(Icons.arrow_back_ios,color: Color(0xff0c2551),), onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return Home();
                    }));
                  }),
                  Center(
                    child: Text('Accident and Injuries', style: TextStyle(
                      color: Color(0xff0c2551),
                      fontSize: 25.0,
                      fontFamily: 'Cardo'
                    ),),

                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    MyContainer('Difficulty breathing', 'images/diff.png',(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Breathing();
                      }));
                    }),
                    MyContainer('Signs of a heart attack', 'images/heartAttack.png',(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Heart();
                      }));
                    })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    MyContainer('Faint', 'images/fain_back.png' ,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Faint();
                      }));
                    }),
                    MyContainer('Dizzy', 'images/Dizzyy.png' ,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Dizzy();
                      }));
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    MyContainer('bleeding', 'images/bleeding.png' ,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Bleeding();
                      }));
                    }),
                    MyContainer('person have a burn or scald', 'images/personBurn.png' ,(){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Burn();
                      }));
                    })
                  ],
                ),
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                color: Color(0xff0c2551),
                child: Center(
                    child: TextButton(
                      child: Text('Call Embulance',style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Cardo',
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
                      onPressed: (){
                        customlaunch('tel:123');
                      },
                    ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
