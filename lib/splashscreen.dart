import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mexpert_test/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
    startTime();
  }

  
  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }
route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const IntroScreen()
      )
    ); 
  }
  
    @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("assets/images/splashimage.png"),
        ),
      ),
    );
  }
}
