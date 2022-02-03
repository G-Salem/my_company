import 'package:flutter/material.dart';
import 'package:my_company/Screens/sign_in/login.dart';
import 'package:my_company/Screens/sign_up/register1.dart';
import 'package:my_company/components/already_have_an_account_acheck.dart';
import 'package:my_company/components/rounded_button.dart';
import '../../constants.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  'assets/logimesLogo.png',
                  width: 170,
                  height: 130,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.15),
            Center(
                child: Text(
              "MyCompany",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 38.0,
                  fontWeight: FontWeight.normal,
                  color: kPrimaryLightColor),
            )),
            SizedBox(height: size.height * 0.25),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Register1();
                    },
                  ),
                );
              },
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.20),
            Center(
                child: Text(
              "Copy right 2022- Version 1.0",
              style: TextStyle(
                color: CopyRightColor,
                fontFamily: 'Montserrat',
                fontSize: 10.0,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
