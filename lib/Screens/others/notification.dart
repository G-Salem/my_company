import 'package:flutter/material.dart';

class AllNotifs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.1),
          Text("AAAAAAAAAAAAAa")
         ],
      ),
    );
  }
}
