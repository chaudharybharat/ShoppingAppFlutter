import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:groceries_shopping_app/screens/home.dart';

import '../app_preferences.dart';
import 'login_screen.dart';
//import 'package:flutter/foundation.dart' show kIsWeb;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AppPreferences _appPreferences = AppPreferences();

  // bool _haveLeftScreen = false;
  //bool _userHasInteracted = false; // used for web video, so we get an interaction
  // in and then can play audio.

  // This would be used for precaching the splash destination
  // image so there's no display delay the first time
  // the Hero() transitions
  //@override
  //void didChangeDependencies() {
  //  super.didChangeDependencies();
  //  //precacheImage(logo.image, context);
  //}

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    await Future.delayed(const Duration(seconds: 2), () {
      print("=====redirectScreen==========");
      redirectScreen();
    });
    /* var duration = new Duration(seconds: 3);
    return new Timer(duration, redirectScreen());*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: Center(
      //   child: Image.asset(
      //     'lib/assets/images/0019.png',
      //     height: 200,
      //     width: 200,
      //   ),
      // )
      body: Center(
          child: Image.asset(
        "assets/images/splash.png",
        height: 200.0,
        width: 200.0,
        gaplessPlayback: true,
      )),
    );
  }

  @override
  void dispose() {
    //   _controller.dispose();
    super.dispose();
  }

  redirectScreen() {
    print("==redirectScreen====");
    //logi pre flow below
    _appPreferences.getLoggedIn().then((isLoggedIn) {
      if (isLoggedIn) {
        Navigator.pushAndRemoveUntil(
            context,
            // MaterialPageRoute(builder: (context) => MainScreen()),
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (r) => false);
      } else {
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     // MaterialPageRoute(builder: (context) => MainScreen()),
        //     MaterialPageRoute(builder: (context) => MainScreen()),
        //     (r) => false);
        Navigator.pushAndRemoveUntil(
            context,
            // MaterialPageRoute(builder: (context) => MainScreen()),
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (r) => false);
      }
    });
  }
}
