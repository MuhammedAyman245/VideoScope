import 'package:flutter/material.dart';
import 'package:grad/screens/faint.dart';
import 'package:grad/screens/quistions.dart';
import 'package:grad/widgets/myContainer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'breath.dart';
import 'dizzy.dart';

class Heart extends StatefulWidget {
  static const String id = 'heart';
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
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
      home: Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                SizedBox(width: 20.0,),
                IconButton(icon: Icon(Icons.arrow_back,size: 50,), onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return Questions();
                  }));
                })
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,30,8.0,15),
              child: Center(child: Text('Heart Attack may happen for many reasons.',
                style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),)),
            ),
            Container(
              height: 270,
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('images/HAR.png'),
                    fit: BoxFit.fill
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,30,8.0,15),
              child: Center(child: Text('1. If the person feels a Pain in his chest',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Cardo',
                  color:Color(0xff0c2551),
                ),)),
            ),
            Container(
              height: 270,
              width: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('images/chestPain.png'),
                    fit: BoxFit.fill
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,30,8.0,15),
              child: Center(child:
              Text('Chest Pain usually lasts longer than a few minutes, or goes away and comes back.\n Pain in one or both arms, the back, neck, jaw or stomach. \n',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Cardo',
                  color:Color(0xff0c2551),
                ),)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,30,8.0,15),
              child: Center(child: Text('2. If the person feels faint or dizzy',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Cardo',
                  color:Color(0xff0c2551),
                ),)),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  MyContainer('Faint', 'images/fain_back.png',(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Breathing();
                    }));
                  }),
                  MyContainer('Dizzy', 'images/Dizzyy.png',(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Heart();
                    }));
                  })
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,30,8.0,15),
              child: Center(child: Text('3. If the person has difficulty to breathing',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Cardo',
                  color:Color(0xff0c2551),
                ),)),
            ),
            MyContainer('Difficulty breathing', 'images/diff.png',(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Breathing();
              }));
            }),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 13, 4.0, 13),
                  child: Text('If the person still have a problem..',style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Cardo',
                    color:Color(0xff0c2551),),),
                ),
                TextButton(onPressed: (){ customlaunch('tel:123'); }, child: Container(
                    height: 50.0,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Color(0xff0c2551),
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Row(
                        children: [
                          Text('Call Ambulance',style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Cardo',
                            color:Colors.grey[200],),),
                          Icon(Icons.call,color:Colors.grey[200],),
                        ],
                      ),
                    ))),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
