import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:my_company/Screens/sign_up/register2.dart';
import 'package:my_company/components/rounded_button.dart';
import 'package:my_company/models/societe.dart';
import 'package:postgres/postgres.dart';
import '../../constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Register1 extends StatefulWidget {
  @override
  _Register1State createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final matriculeFiscaleController = TextEditingController();
  String companyName = '';
  bool _validate = false;
  var exist = false;

  void addToprefs(String aa, bb) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(aa, bb);
  }

  @override
  Widget build(BuildContext context) {
    // var connection = new PostgreSQLConnection(
    //     "www.logimes.com", 5432, "Logimes",
    //     username: "postgres", password: "Logime\$2022");

    // var connection = new PostgreSQLConnection("41.226.34.210", 5432, "Logimes",
    //     username: "postgres", password: "admin");

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
            SizedBox(height: size.height * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.4),
                    ),
                    labelText: 'Registration number',
                    errorText: _validate
                        ? 'Registration number Can\'t Be Empty'
                        : null,
                    errorStyle: TextStyle(color: kSecondaryColor),
                    errorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: kSecondaryColor, width: 0.4),
                    ),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                controller: matriculeFiscaleController,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            RoundedButton(
              text: "Continue",
              press: () async {
                final String registrationNumberText =
                    matriculeFiscaleController.text.trim();
                setState(() {
                  matriculeFiscaleController.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });
                // await connection.open();
                // if (connection.isClosed) {
                //   await connection.open();
                // }
                var url =Uri.parse( "http://www.logimes.com:3300/Soc");
                final response = await http.get(url);
                var responseData = json.decode(response.body);
                // ignore: non_constant_identifier_names
                for (var Soc in responseData) {
                  Societe societe = Societe(
                    matFiscale: Soc["MatFiscale"],
                    nomSociete: Soc["NomSociete"],
                  );
                  var number = societe.matFiscale;
                  var name = societe.nomSociete;
                  matriculeFiscaleController.text.isEmpty
                      ? _validate = true
                      : _validate = false;

                  if (!_validate) {
                    if (registrationNumberText == number) {
                      exist = true;
                      companyName = name;
                      // ajout du matricule fiscale dans shared prefs
                      addToprefs("registrationNumber", registrationNumberText);
                      // ma fhemtech aalech ma y7ellech ezzouz
                      addToprefs("companyName", companyName);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Register2();
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
                            'Please check your registration number or contact an administrator',
                        btnCancelOnPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Register1()));
                        },
                        btnCancelColor: kSecondaryColor,
                        btnOkColor: RoundedButtonColor,
                        btnOkOnPress: () {
                          exit(0);
                        },
                      )..show();
                    }
                  }
                }
              },
            ),
            SizedBox(height: size.height * 0.23),
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

  // Future<List<Societe>> getAllFromSaiSoc() async {
  //   String url = "http://www.logimes.com:5434/Soc";
  //   final response = await http.get(Uri.parse(url));

  //   var responseData = json.decode(response.body);
  //   // print(responseData);
  //   List<Societe> societes = [];

  //   // ignore: non_constant_identifier_names
  //   for (var Soc in responseData) {
  //     Societe societe = Societe(
  //       matFiscale: Soc["MatFiscale"],
  //       nomSociete: Soc["NomSociete"],
  //     );
  //     societes.add(societe);
  //   }
  //   return societes;
  //   // print(societes[0].matFiscale);
  // }

}
