import 'dart:async';
import 'package:flutter/material.dart';

import '../home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handlePush();
  }
  void handlePush() {
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                 width: 250,
                // height: 150,
                child: Image.asset(
                  "assets/global-news.gif",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
