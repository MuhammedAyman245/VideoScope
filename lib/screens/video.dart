import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad/screens/try.dart';

class Video extends StatefulWidget {
  static const String id = 'Video';
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Heart Rate Measuring',
            style: TextStyle(
              fontFamily: 'Cardo',
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w900
          ),)),
          backgroundColor: Color(0xff0c2551),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Image.asset('images/camera.png'),
            SizedBox(height: 40,),
            Center(
              child: Container(
                height: 70.0,
                width: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0xff0c2551)
                ),
                child: TextButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                        return Try();
                      }));
                    },
                  child: Text(
                  'Start the video Recording',
                  style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 20.0,
                        fontFamily: 'Cardo'
                  ),
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
