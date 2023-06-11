import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/screens/quistions.dart';
import 'package:url_launcher/url_launcher.dart';
class Breathing extends StatelessWidget {
static const String id = 'breathing';
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
        backgroundColor: Colors.white,
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
                child: Text('If the person is difficult to breath there are some of useful positions',style: TextStyle(
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
                  image: AssetImage('images/diff.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('1. Tripod seated position',style: TextStyle(
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
                  image: AssetImage('images/tripod.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('2. Upright down seated position',style: TextStyle(
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
                  image: AssetImage('images/upright.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('3. Tripod Standing Position',style: TextStyle(
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
                  image: AssetImage('images/tripod_standing.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('3. Reverse Seated Position',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),),),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('images/revers.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('4. Wall Standing Position',style: TextStyle(
                fontSize: 18,
                fontFamily: 'Cardo',
                color:Color(0xff0c2551),),),
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('images/wall.png'),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 13, 4.0, 13),
                  child: Text('If the patient still have a problem in breathing please',style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Cardo',
                    color:Color(0xff0c2551),),),
                ),
                TextButton(onPressed: (){customlaunch('tel:123');
                }, child: Container(
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
