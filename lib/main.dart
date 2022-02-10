import 'package:flutter/material.dart';
import 'package:my_company/Screens/others/onBoarding.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Company',
      home: OnboardingScreen(),
    );
  }
}

// timer lel splash screeen w mba3ed ta3teha navigator.push .....