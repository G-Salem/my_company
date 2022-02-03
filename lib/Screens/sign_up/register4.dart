import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_company/Screens/sign_up/register3.dart';
import 'package:my_company/Screens/sign_up/register5.dart';
import 'package:my_company/components/rounded_button.dart';
import '../../constants.dart';

// ignore: must_be_immutable
class Register4 extends StatefulWidget {
  final int number;
  final String mail;

  Register4({Key key, this.number, this.mail}) : super(key: key);

  @override
  State<Register4> createState() => _Register4State();
}

class _Register4State extends State<Register4> {
  var codeController;
  bool _validate = false;
  var a = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(height: size.height * 0.25),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(
                            first: true, last: false, context: context),
                        _textFieldOTP(
                            first: false, last: false, context: context),
                        _textFieldOTP(
                            first: false, last: false, context: context),
                        _textFieldOTP(
                            first: false, last: true, context: context),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.1),
              RoundedButton(
                text: "Continue",
                press: () {
                  setState(() {
                    a == '' ? _validate = true : _validate = false;
                  });
                  if (!_validate) {
                    if (int.parse(a) == widget.number) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Register5(mail: widget.mail);
                          },
                        ),
                      );
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Wrong Registration number',
                        desc:
                            'Please check your verification number or email or contact an administrator',
                         btnCancelOnPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Register3()));
                        },
                        btnCancelColor: kSecondaryColor,
                        btnOkColor: RoundedButtonColor,
                        btnOkOnPress: () {
                          exit(0);
                        },
                      )..show();
                    }
                  }
                },
              ),
              SizedBox(height: size.height * 0.2),
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
      ),
    );
  }

// don't forget el alert ba3d el mail
  Widget _textFieldOTP({bool first, last, BuildContext context}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
            a = a + value.toString();
          },
          showCursor: true,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            errorText: _validate ? 'Verification code Can\'t Be Empty' : null,
            errorStyle: TextStyle(color: kSecondaryColor),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kSecondaryColor, width: 0.4),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12)),
          ),
          controller: codeController,
        ),
      ),
    );
  }
}
