import 'package:flutter/material.dart';
//import 'package:flutter_splash_screen_example/splash_screen.dart';
import 'package:food_app2/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        fontFamily: 'LilitaOne-Regular',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
