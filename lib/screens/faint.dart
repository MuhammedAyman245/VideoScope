import 'package:flutter/material.dart';
import 'package:grad/screens/quistions.dart';
import 'package:url_launcher/url_launcher.dart';

class Faint extends StatelessWidget {
  static const String id = 'faint';
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
                IconButton(icon: Icon(Icons.arrow_back,size: 50,color: Color(0xff0c2551)), onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return Questions();
                  }));
                })
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,30,8.0,15),
              child: Center(
                child: Text('If the person faint we should help him',style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Cardo',
                  color:Color(0xff0c2551),
                ),),
              ),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('images/faint.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('1. Lay person in the back',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('images/lay.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('2. elevate legs to restore blood flow to the brain',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('images/leg.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('3. Removing tight clothes',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('images/remove.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('4. Try to wake up the person  ',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('images/revive.png'),
                ),
              ),
            ),
            TextButton(onPressed: (){customlaunch('tel:123');}, child: Container(
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
      ),
    );
  }
}
