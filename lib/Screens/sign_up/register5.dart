import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_company/Screens/sign_in/login.dart';
import 'package:my_company/components/rounded_button.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;

class Register5 extends StatefulWidget {
  final String mail;
  Register5({Key key, this.mail}) : super(key: key);

  @override
  State<Register5> createState() => _Register5State();
}

class _Register5State extends State<Register5> {
  int a;
  bool _validate = false;
  final password1 = TextEditingController();
  final password2 = TextEditingController();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var x = widget.mail;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
            child: Column(children: [
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
            "SET PASSWORD",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: kPrimaryLightColor),
          )),
          SizedBox(height: size.height * 0.15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            child: TextFormField(
              obscureText: _obscure,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    child: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.4),
                  ),
                  labelText: 'Password',
                  errorText: _validate ? 'Password field is empty' : null,
                  errorStyle: TextStyle(color: kSecondaryColor),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kSecondaryColor, width: 0.4),
                  ),
                  labelStyle: TextStyle(color: Colors.white)),
              controller: password1,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            child: TextFormField(
              obscureText: _obscure,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    child: Icon(
                      _obscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.4),
                  ),
                  labelText: 'Confirm your password',
                  errorText: _validate ? 'Password field is empty ' : null,
                  errorStyle: TextStyle(color: kSecondaryColor),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kSecondaryColor, width: 0.4),
                  ),
                  labelStyle: TextStyle(color: Colors.white)),
              controller: password2,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: size.height * 0.1),
          RoundedButton(
            text: "Login",
            press: () async {
              var pwd;
              print(x);
              setState(() {
                password1.text.isEmpty | password2.text.isEmpty
                    ? _validate = true
                    : _validate = false;
              });
              if (!_validate) {
                if (password2.text == password1.text) {
                  pwd = password1.text;
                  var pwdmail = widget.mail;
                  print(pwd);
                  print(pwdmail);
                  http.put(
                    Uri.parse('http://www.logimes.com:3300/MajUserPass'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      "Password": '$pwd',
                      "Email": '$pwdmail'
                    }),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                } else {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.ERROR,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'OOPS',
                    desc: 'Passwords does not match',
                    btnCancelOnPress: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register5()));
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
          SizedBox(height: size.height * 0.1),
          Center(
              child: Text(
            "Copy right 2022- Version 1.0",
            style: TextStyle(
              color: CopyRightColor,
              fontFamily: 'Montserrat',
              fontSize: 10.0,
            ),
          )),
        ])));
  }
}
