import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/Splash.dart';

import 'Home.dart';
import 'login.dart';

List<CameraDescription> cameras=[];
main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String,WidgetBuilder>{
        '/Home':(BuildContext context)=>new Home(),
        '/Login':(BuildContext context)=>new Login(),
      },
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}