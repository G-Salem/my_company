import 'package:flutter/material.dart';

class DetailCard  extends StatelessWidget {

  final String invoiceRef, amount, date, status;
  final Function press;
  final Color color;
  const DetailCard({
    Key key,
    this.date,
    this.press,
    this.status,
    this.invoiceRef,
    this.amount,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press ,
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
                invoiceRef,
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
                amount,
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
                date,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montesserat',
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 345),
              child: status == "R"
                  ? Text(
                      status,
                      style: TextStyle(
                          color: Color(0xffC9ADFF) ,
                          fontFamily: 'Montesserat',
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  : status == "PR"
                      ? Text(
                          status,
                          style: TextStyle(
                              color: Color(0xffF3A530),
                              fontFamily: 'Montesserat',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                       status,
                        style: TextStyle(
                            color: Color(0xffE8625C) ,
                            fontFamily: 'Montesserat',
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
