import 'package:flutter/material.dart';
import 'package:grad/circle.dart';
import 'package:grad/screens/bleeding.dart';
import 'package:grad/screens/breath.dart';
import 'package:grad/screens/burn.dart';
import 'package:grad/screens/dizzy.dart';
import 'package:grad/screens/heartAttack.dart';
import 'package:grad/screens/accident.dart';
import 'package:grad/screens/bar.dart';
import 'package:grad/screens/camera.dart';
import 'package:grad/screens/logIn.dart';
import 'package:grad/screens/signUp.dart';
import 'package:grad/screens/try.dart';
import 'package:grad/screens/video.dart';
import 'package:grad/screens/welcome.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Welcome.id,
      routes: {
        bom.id: (context) => bom(),
        Try.id: (context) => Try(),
        SignIn.id: (context) => SignIn(),
        Welcome.id: (context) => Welcome(),
        Register.id: (context) => Register(),
        Home.id: (context) => Home(),
        Video.id: (context) => Video(),
        Accident.id: (context) => Accident(),
        CameraAccess.id: (context) => CameraAccess(),
        Bleeding.id: (context) => Bleeding(),
        Dizzy.id: (context) => Dizzy(),
        Burn.id: (context) => Burn(),
        Breathing.id: (context) => Breathing(),
        Heart.id: (context) => Heart(),
      },
    );
  }
}
