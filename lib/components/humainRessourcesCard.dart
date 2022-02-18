import 'package:flutter/material.dart';

class HumainRessourcesCard extends StatelessWidget {
  final String nom, amount, date;
  final Color color;
  const HumainRessourcesCard({
    Key key,
    this.date,
    this.nom,
    this.amount,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
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
                margin: EdgeInsets.only(top: 35, left: 40),
                child: Text(
                  nom,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montesserat',
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 65, left: 40),
                child: Text(
                  amount,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montesserat',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35, left: 240),
                child: Text(
                  date,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montesserat',
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
