import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_splash_screen_example/home.dart';
import 'package:food_app2/home.dart'; // Import your home.dart file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a time-consuming task, such as initializing services or loading data.
    // For demonstration purposes, we'll use a Future.delayed here.
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the home screen after the splash screen.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(), // Use your HomeScreen widget
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/diet.png', // Replace with the actual path to your image
              width: 150, // Adjust the width as needed
              height: 150, // Adjust the height as needed
            ),
            SizedBox(height: 20), // Add some spacing
            Text(
              'Foodie',
              style: TextStyle(
                fontSize: 54,
                fontFamily: 'LilitaOne-Regular',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
