import 'package:flutter/material.dart';
import '../constants.dart';

class DetailCard extends StatefulWidget {
  final String invoiceRef , amount , date , status ;
  final Function press;
  final Color color;
  const DetailCard({
    Key key,
    this.date,
    this.press,
    this.status,
    this.invoiceRef,
    this.amount,
    this.color = kCardFinColor,
  }) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return    GestureDetector(
              onTap: null,
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
                      margin: EdgeInsets.only(top: 24, left: 10),
                      child: Text(
                        widget.invoiceRef,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montesserat',
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 131, top: 24),
                      child: Text(
                        widget.amount,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montesserat',
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24, left: 230),
                      child: Text(
                       widget.date,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montesserat',
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ),Container(
                      margin: EdgeInsets.only(top: 24, left: 345),
                      child: Text(
                       widget.status,
                        style: TextStyle(
                            color: Colors.red ,
                            fontFamily: 'Montesserat',
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ;
  }
}

