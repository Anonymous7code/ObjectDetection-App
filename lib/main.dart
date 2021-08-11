// @dart=2.9

import 'package:flutter/material.dart';
import 'package:objdetetcion/mysplashscreen.dart';
import 'package:camera/camera.dart';

List cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Object Detection',
      home: MySplashScreen(),
    );
  }
}
