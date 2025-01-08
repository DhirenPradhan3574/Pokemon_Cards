import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card/screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds before navigating to the next screen
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the ListScreen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/splashImage.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
