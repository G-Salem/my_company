import 'package:flutter/material.dart';
import 'package:my_company/Screens/fico/details/outcomes/detailOutcomeClient.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';

class DetailChequesOut extends StatefulWidget {
  final Details detail;

  const DetailChequesOut({Key key, this.detail}) : super(key: key);
  @override
  State<DetailChequesOut> createState() => _DetailChequesOutState();
}

class _DetailChequesOutState extends State<DetailChequesOut> {
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Text(
           "Regulation " + widget.detail.invoiceRef,
            style: TextStyle(color: Colors.white),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: kInsideColor.withOpacity(0.3),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AllNotifs();
                        },
                      ),
                    );
                  },
                  child: Icon(Icons.notifications),
                )),
          ]),
      drawer: NavBar(),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 70,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.white,
        selectedItemColor: kSecondaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: kBottomColor,
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                height: size.height * 0.05,
                child: Icon(
                  Boxicons.bx_wallet, size: 30,
                  // color: Colors.white,
                ),
              ),
              label: "Finance",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_user, size: 30),
            label: "HR",
          ),
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bxs_box, size: 30),
            label: "Stock",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      backgroundColor: kInsideColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Center(
              child: GestureDetector(
                onTap: null,
                child: Container(
                  child: new Stack(
                    children: <Widget>[
                      Container(
                          height: 250.0,
                          width: 350,
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
                        margin: EdgeInsets.only(top: 40, left: 30),
                        child: Text(
                          "check 1",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montesserat',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, left: 260),
                        child: Text(
                          "700 Tnd",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montesserat',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 80, left: 30),
                        child: Text(
                          "check 2",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montesserat',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 80, left: 260),
                        child: Text(
                          "200 Tnd",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montesserat',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 120, left: 30),
                        child: Text(
                          "check 3",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montesserat',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 120, left: 260),
                        child: Text(
                          "100 Tnd",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montesserat',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 160, left: 26),
                        child: Text(
                            "___________________________________________________________________________________________" , style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w100 ,fontSize: 8)),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 200, left: 30),
                        child: Text(
                          "Still",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montesserat',
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 200, left: 270),
                        child: Text(
                          "0 Tnd",
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
            )
          ],
        ),
      ),
    );
  }
}

class Detail {
  int id;
  String invoiceRef, amount, date, status;

  Detail({this.id, this.invoiceRef, this.date, this.amount, this.status});
}
