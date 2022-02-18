import 'package:flutter/material.dart';
import 'package:my_company/Screens/others/onBoarding.dart';
import 'package:my_company/Screens/splash/splashScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:my_company/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Company',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: 'assets/logimesLogo.png',
            nextScreen: SplashScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: kPrimaryColor));
  }
}