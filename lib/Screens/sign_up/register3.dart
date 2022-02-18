import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_company/Screens/sign_up/register4.dart';
import 'package:my_company/components/rounded_button.dart';
import '../../constants.dart';
import 'dart:math';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class Register3 extends StatefulWidget {
  @override
  State<Register3> createState() => _Register3State();
}

class _Register3State extends State<Register3> {
  bool _validate = false;

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final number = Random().nextInt(8999) + 1000;
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
              "REGISTER",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  color: kPrimaryLightColor),
            )),
            SizedBox(height: size.height * 0.12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.4),
                    ),
                    //probleme dans la couleur
                    labelText: 'Enter your email',
                    errorText: _validate ? 'Email Can\'t Be Empty' : null,
                    errorStyle: TextStyle(color: kSecondaryColor),
                    errorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: kSecondaryColor, width: 0.4),
                    ),
                    labelStyle: TextStyle(color: Colors.white)),
                controller: emailController,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: size.height * 0.13),
            RoundedButton(
              text: "Continue",
              press: () async {
                await sendmail(emailController.text, number);
                setState(() {
                  emailController.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });
                if (!_validate) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Succes',
                    desc: 'The verification code was sent to your email',
                    btnOkColor: kSecondaryColor,
                    btnOkOnPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Register4(
                                number: number, mail: emailController.text);
                          },
                        ),
                      );
                    },
                  )..show();
                }
              },
            ),
            SizedBox(height: size.height * 0.17),
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

  sendmail(String recipEmail, int rand) async {
    String username = 'mycomanylogimes@gmail.com';
    String password = 'ali@ali@ali';

    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'SALEM')
      ..recipients.add('$recipEmail')
      ..subject = 'Verification Code for MyCompany mobile APP '
      ..text =
          'This is an email that contains the one and only verification Code that you have. Please read it carefully and put it in your app.'
      ..html = "<h1>Verification Code</h1>\n<p> $rand </p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
