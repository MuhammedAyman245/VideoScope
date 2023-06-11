import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grad/screens/accident.dart';
import 'package:grad/screens/video.dart';

class Home extends StatefulWidget {
  static const String id = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  final screen=[Accident(),Video()];
  int _index=1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.directions_car_outlined, size: 30,color: Colors.white),
            Icon(Icons.videocam, size: 30,color: Colors.white),
          ],
          color: Color(0xff0c2551),
          buttonBackgroundColor: Color(0xff0c2551),
          backgroundColor:  Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: screen[_index],
      ),
    );
  }
}
