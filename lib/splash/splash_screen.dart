import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymapp/presentation_screen/presentation_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;
/* 
  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _introSeen = (prefs.getBool('intro_seen') ?? false);

    Navigator.pop(context);
    if (_introSeen) {
      Navigator.pushNamed(context, 'main');
    } else {
      await prefs.setBool('intro_seen', true);
      Navigator.pushNamed(context, 'intro');
    }
  } */

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);

    return AnimatedSplashScreen(
      splash: Image.asset('assets/images/qfr.png'),
      splashIconSize: 200,
      nextScreen: const PresentationScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      duration: 3000,
    );
  }
}
