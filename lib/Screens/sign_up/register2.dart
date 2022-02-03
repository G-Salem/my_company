import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_company/Screens/sign_up/register3.dart';
import 'package:my_company/components/rounded_button.dart';
import 'package:postgres/postgres.dart';
import '../../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register2 extends StatefulWidget {
  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  var connection = new PostgreSQLConnection("10.0.2.2", 5432, "Logimes",
      username: "postgres", password: "admin");
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
    // ignore: await_only_futures
    var x = await prefs.getString(content);

    return x;
  }

  @override
  void initState() {
    _getThingsOnStartup().then((value) {
    });
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
                              return Center( child: Text("Logidas" , style:TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.normal,
                                    color: kPrimaryLightColor) ,),
                              //     child: SpinKitRotatingCircle(
                              //   color: Colors.white,
                               //   size: 50.0,
                              // )
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
                final String sName = sessionNameController.text;
                setState(() {
                  sessionNameController.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });
                if (connection.isClosed) {
                  await connection.open();
                }
                List<Map<String, Map<String, dynamic>>> selectionResult =
                    await connection.mappedResultsQuery(
                        "SELECT \"IdSession\" FROM public.\"SaiSession\"WHERE \"SessionName\" = '$sName'");

                 var idSession = selectionResult[0]["SaiSession"]["IdSession"] ;

                if (idSession == null) {
                  print("AAA");
                  // i didn't know how to test it 
                  // le test 3al nul ==> alert dialog w nafs'ha mta3 el page loula 
                } else {
                      prefs.setInt("idSession", idSession);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Register3();
                    },
                  ),
                );
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
