import 'package:flutter/material.dart';
import '../constants.dart';

class FinanceCard extends StatelessWidget {
  final String title, money;
  final Function press;
  final Color color;
  final String date;
  const FinanceCard({
    Key key,
    this.title,
    this.money,
    this.date,
    this.press,
    this.color = kCardFinColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        child: new Stack(
          children: <Widget>[
            Container(
                height: 100.0,
                width: 328,
                decoration: new BoxDecoration(
                    color: color.withOpacity(0.8),
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.circular(15.0),
                    boxShadow: <BoxShadow>[
                      new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          offset: new Offset(07.0, 10.0))
                    ])),
            Container(
              margin: EdgeInsets.only(top: 25, left: 29),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montesserat',
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 225, top: 39),
              child: Text(
                money,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montesserat',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
               Container(
              margin: EdgeInsets.only(top: 60, left: 29),
              child: Text(
                date,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montesserat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
