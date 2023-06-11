import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/screens/quistions.dart';

class Bleeding extends StatelessWidget {
  static const String id = 'bleed';
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
                child: Text('If the person is bleeding',style: TextStyle(
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
                  image: AssetImage('images/bleeding.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40.0, 4.0, 0),
              child: Text('1. You Should Stop the bleeding ',style: TextStyle(
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
                  image: AssetImage('images/stop.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 0),
              child: Text('– Minor cuts and scrapes usually stop bleeding on their own.\n – If they don\'t, apply gentle pressure with a clean cloth or bandage. Hold the pressure continuously for 20 to 30 minutes and if possible elevate the wound as in the above image.',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40.0, 4.0, 0),
              child: Text('2. You Should clean the wound',style: TextStyle(
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
                  image: AssetImage('images/clean.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 0),
              child: Text('– Rinse out the wound with clear water. Soap can irritate the wound, so try to keep it out of the actual wound.\n – If dirt or debris remains in the wound after washing, use tweezers cleaned with alcohol to remove the particles.\n – To clean the area around the wound, use soap and a washcloth.\n – There\'s no need to use hydrogen peroxide, iodine or an iodine-containing cleanser.',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40.0, 4.0, 0),
              child: Text('3. You Should cover the wound',style: TextStyle(
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
                  image: AssetImage('images/cover.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 4.0, 4.0, 0),
              child:
              Text('– If the bleeding slows, cover the wound with a clean dressing and bandage.\n– Dressings and bandages can help keep the wound clean and keep harmful bacteria out.',
                style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),),
            ),
            Text(''),
          ],
        ),
      ),
    );
  }
}
