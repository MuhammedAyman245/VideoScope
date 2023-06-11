import 'package:flutter/material.dart';
import 'package:grad/screens/quistions.dart';

class Burn extends StatelessWidget {
  static const String id = 'Burn';
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
                child: Text('If the person is burn ',style: TextStyle(
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
                  image: AssetImage('images/personBurn.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40, 0, 2),
              child: Text('1. You Should Soak the burned area in water',style: TextStyle(
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
                  image: AssetImage('images/water.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40, 0, 2),
              child: Text('2. Put ice on the burned area',style: TextStyle(
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
                  image: AssetImage('images/cold.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 40, 0, 2),
              child: Text('3. Cover the burned area with bandage',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),
              ),),
            ),
            Text('3. Cover the burned area with bandage'),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('images/bandage.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
