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
      seconds: 14,
      navigateAfterSeconds: Home(),
      image: Image.asset('assets/logo.png'),
      useLoader: true,
      loaderColor: Colors.red,
      loadingText: Text(
        'Loading... ',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
