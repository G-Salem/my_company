import 'package:flutter/material.dart';
import '../../constants.dart';

class HomeInside extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.15),
          Center(
            child: Container(
                padding:  EdgeInsets.fromLTRB(0, 5, 20, 0),
              child: Image.asset(
                'assets/finance.png',
                width: 300,
                height: 300,
              ),
            ),
          ),
              Padding(
                padding:  EdgeInsets.fromLTRB(40, 5, 20, 0),
                child: Center(
                  child: Text(
            "Easy monitoring of the finanezfknzfcial situation",
            style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
          ),
                ),
              ),
              SizedBox(height: size.height * 0.1),
              Padding(
                padding:  EdgeInsets.fromLTRB(30, 5, 20, 0),
                child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Iaculis purus purus mi urna feugiat mi suspendisse mauris. Sodales nam",
            style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
          ),
              ),
       
          Center(
              child: Text(
            "REGISTER",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: kInsideColor),
          )),
        ],
      ),
    );
  }
}