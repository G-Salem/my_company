// ignore_for_file: await_only_futures

import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_company/Screens/sign_up/register3.dart';
import 'package:my_company/components/rounded_button.dart';
import 'package:my_company/models/Session.dart';
import '../../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Register2 extends StatefulWidget {
  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  SharedPreferences prefs;
  String cName;
  Future variable;
  bool _validate = false;
  final sessionNameController = TextEditingController();

  _getThingsOnStartup() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    cName = await prefs.getString("companyName");
  }

  Future<String> getPrefs(String content) async {
    var x = await prefs.getString(content);
    return x;
  }

  @override
  void initState() {
    _getThingsOnStartup().then((value) {});
    super.initState();
  }

  Future<String> getCompanyName() async {
    return prefs.getString("companyName");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Center(
              child: Container(
                child: Image.asset(
                  'assets/logimesLogo.png',
                  width: 170,
                  height: 130,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.1),
            Center(
                child: Container(
                    height: 80,
                    child: FutureBuilder(
                        future: getCompanyName(),
                        builder: (context, snapshot) {
                          do {
                            if (snapshot.hasData) {
                              return Text(
                                cName,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.normal,
                                    color: kPrimaryLightColor),
                              );
                            } else {
                              return Center(
                                    child: SpinKitRotatingCircle(
                                  color: Colors.white,
                                  size: 50.0,
                                )
                              );
                            }
                          } while (snapshot.data != cName);
                        }))),
            SizedBox(height: size.height * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.4),
                    ),
                    //probleme dans la couleur
                    labelText: 'Session name',
                    errorText:
                        _validate ? 'Session name Can\'t Be Empty' : null,
                    errorStyle: TextStyle(color: kSecondaryColor),
                    errorBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: kSecondaryColor, width: 0.4),
                    ),
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
                controller: sessionNameController,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            RoundedButton(
              text: "Continue",
              press: () async {
                final String sName = sessionNameController.text.toString();
                setState(() {
                  getCompanyName();
                  sessionNameController.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });
                var url = Uri.parse("http://www.logimes.com:3300/Session/$sName");
                final response = await http.get(url);
                var responseData = json.decode(response.body);
                 var sessionID;
                // ignore: non_constant_identifier_names
                for (var Soc in responseData) {
                  Session session = Session(
                      idSession: Soc["IdSession"],
                      sessionName: Soc["SessionName"]);
                   sessionID = session.idSession;
                  if (sessionID == null) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Wrong session name',
                      desc:
                          'Please check your session name or contact an administrator',
                      btnCancelOnPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register2()));
                      },
                      btnCancelColor: kSecondaryColor,
                      btnOkColor: RoundedButtonColor,
                      btnOkOnPress: () {
                        exit(0);
                      },
                    )..show();
                  } else {
                    prefs.setInt("idSession", sessionID);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Register3();
                        },
                      ),
                    );
                  }
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
}
