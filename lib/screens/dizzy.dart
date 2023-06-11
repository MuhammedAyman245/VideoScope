import 'package:flutter/material.dart';
import 'package:grad/screens/quistions.dart';
import 'package:url_launcher/url_launcher.dart';
class Dizzy extends StatefulWidget {
  static const String id ='dizzy';
  @override
  _DizzyState createState() => _DizzyState();
}

class _DizzyState extends State<Dizzy> {
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
          body: Column(
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
                  height: 270,
                  width: 270,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('images/dizzy.png'),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0,30,8.0,15),
                      child: Center(
                        child: Text('If the person feels a A change in vision or speech or Shortness of breath or Chest pain Please Call Ambulance',style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Cardo',
                          color:Color(0xff0c2551),
                        ),),
                      ),
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
              ]
          ),
        ),
      ),
    );
  }
}
