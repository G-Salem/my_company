import 'package:flutter/material.dart';

class DetailCardProduitt extends StatelessWidget {
  final String nom, prix;
  final Function press;
  const DetailCardProduitt({Key key, this.nom, this.prix, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: new Stack(
          children: <Widget>[
            Container(
                height: 63.0,
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
            Container(
              margin: EdgeInsets.only(top: 24, left: 40),
              child: Text(
                nom,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montesserat',
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 270),
              child: Text(
                prix,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montesserat',
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
