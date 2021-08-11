import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'home.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: Home(),
      imageBackground: Image.asset('assets/image.jpeg').image,
      useLoader: true,
      loaderColor: Colors.red,
      loadingText: Text(
        'Loading... ',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
