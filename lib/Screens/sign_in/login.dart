import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_company/Screens/fico/layout.dart';
import 'package:my_company/Screens/sign_up/register3.dart';
import 'package:my_company/components/forgotYourPwd.dart';
import 'package:my_company/components/rounded_button.dart';
import 'package:postgres/postgres.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var connection = new PostgreSQLConnection("10.0.2.2", 5432, "Logimes",
      username: "postgres", password: "admin");
  SharedPreferences prefs;
  final mail = TextEditingController();
  final pwd = TextEditingController();
  String _passDb;
  bool _validate = false;
  bool _obscure = true;

  _getThingsOnStartup() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    await connection.open();
  }

  @override
  void initState() {
    _getThingsOnStartup().then((value) {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            "LOGIN",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: kPrimaryLightColor),
          )),
          SizedBox(height: size.height * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.4),
                  ),
                  //probleme dans la couleur
                  labelText: 'Email or Session Name or phone number',
                  errorText: _validate ? 'Email Can\'t Be Empty' : null,
                  errorStyle: TextStyle(color: kSecondaryColor),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kSecondaryColor, width: 0.4),
                  ),
                  labelStyle: TextStyle(color: Colors.white)),
              controller: mail,
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
                        _obscure ? Icons.visibility : Icons.visibility_off , color: Colors.white,),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.4),
                  ),
                  //probleme dans la couleur
                  labelText: 'Password',
                  errorText: _validate ? 'Password Can\'t Be Empty' : null,
                  errorStyle: TextStyle(color: kSecondaryColor),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kSecondaryColor, width: 0.4),
                  ),
                  labelStyle: TextStyle(color: Colors.white)),
              controller: pwd,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: size.height * 0.1),
          RoundedButton(
            text: "Login",
            press: () async {
              setState(() {
                pwd.text.isEmpty | mail.text.isEmpty
                    ? _validate = true
                    : _validate = false;
              });

              if (!_validate) {
                if (connection.isClosed) {
                  await connection.open();
                }
                var x = await checkCredentials(mail.text, pwd.text);
                if (( x > 0)) {
                  await prefs.setInt("compteur", x);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Layout();
                      },
                    ),
                  );
                } else {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.ERROR,
                    animType: AnimType.BOTTOMSLIDE,
                    title: 'Error',
                    desc: 'Please check your credentials !!',
                    btnCancelOnPress: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
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
          ForgotYourPwd(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Register3();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.25),
          Center(
              child: Text(
            "Copy right 2022- Version 1.0",
            style: TextStyle(
              color: CopyRightColor,
              fontFamily: 'Montserrat',
              fontSize: 10.0,
            ),
          ))
        ])));
  }

  Future<int> checkCredentials(String email, pass) async {
    var compteur = 0;
    List<
        Map<
            String,
            Map<String,
                dynamic>>> selectionResult = await connection.mappedResultsQuery(
        "SELECT \"compteur\" FROM public.\"SaiUsers\" WHERE \"Email\" = '$email' and \"Password\" = '$pass'");
    if (selectionResult.isNotEmpty) {
      compteur = selectionResult[0]["SaiUsers"]["compteur"];
    } else {
      compteur = -1;
    }
    return compteur;
  }
}
