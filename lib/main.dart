import 'package:flutter/material.dart';
import 'package:my_company/Screens/splash/splashScreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Company',
      home: SplashScreen(),
    );
  }
}

// timer lel splash screeen w mba3ed ta3teha navigator.push .....