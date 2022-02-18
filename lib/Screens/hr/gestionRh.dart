// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_company/Screens/hr/Cnss/cnss.dart';
import 'package:my_company/Screens/hr/Holidays/holidays.dart';
import 'package:my_company/Screens/hr/Taxes/taxes.dart';
import 'package:my_company/Screens/hr/salary/salary.dart';

class GestionRh extends StatefulWidget {
  @override
  State<GestionRh> createState() => _GestionRhState();
}

class _GestionRhState extends State<GestionRh> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Salary();
                  },
                ),
              );
            },
            child: Container(
              child: new Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                          height: 100.0,
                          width: 370,
                          decoration: new BoxDecoration(
                              color: Color(0xff3D385C).withOpacity(0.7),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(15.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    offset: new Offset(07.0, 10.0))
                              ])),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45, left: 40),
                    child: Text(
                      "Salary",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montesserat',
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1, left: 260),
                    child: Image.asset("assets/salaires.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CNSS();
                  },
                ),
              );
            },
            child: Container(
              child: new Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                          height: 100.0,
                          width: 370,
                          decoration: new BoxDecoration(
                              color: Color(0xff3D385C).withOpacity(0.7),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(15.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    offset: new Offset(07.0, 10.0))
                              ])),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45, left: 40),
                    child: Text(
                      "CNSS",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montesserat',
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1, left: 250),
                    child: Image.asset("assets/cnss.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Taxes();
                  },
                ),
              );
            },
            child: Container(
              child: new Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                          height: 100.0,
                          width: 370,
                          decoration: new BoxDecoration(
                              color: Color(0xff3D385C).withOpacity(0.7),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(15.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    offset: new Offset(07.0, 10.0))
                              ])),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45, left: 40),
                    child: Text(
                      "Taxes",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montesserat',
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1, left: 250),
                    child: Image.asset("assets/taxes.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Holidays();
                  },
                ),
              );
            },
            child: Container(
              child: new Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                          height: 100.0,
                          width: 370,
                          decoration: new BoxDecoration(
                              color: Color(0xff3D385C).withOpacity(0.7),
                              shape: BoxShape.rectangle,
                              borderRadius: new BorderRadius.circular(15.0),
                              boxShadow: <BoxShadow>[
                                new BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10.0,
                                    offset: new Offset(07.0, 10.0))
                              ])),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 45, left: 40),
                    child: Text(
                      "Holidays",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montesserat',
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1, left: 250),
                    child: Image.asset("assets/conge.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
