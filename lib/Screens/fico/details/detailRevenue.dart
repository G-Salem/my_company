import 'package:flutter/material.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:my_company/components/detailCard.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';
import 'package:my_company/Screens/fico/financialManagement.dart';

class DetailRevenue extends StatefulWidget {

  final  Entrees entree;
  // DetailRevenue({Key key, this.entree}) : super(key: key);
  DetailRevenue({Key key, this.entree}) : super(key: key);

  @override
  State<DetailRevenue> createState() => _DetailRevenueState();
}

List<bool> isSelected;
List<Detail> det = [
  Detail(
      id: 1,
      invoiceRef: "PRE-(A)-(4N)",
      amount: "3000Tnd",
      date: "12 Janvier 2022",
      status: "R"),
  Detail(
      id: 1,
      invoiceRef: "PRE-(F)-(8N)",
      amount: "2000Tnd",
      date: "10 Janvier 2022",
      status: "PR"),
  Detail(
      id: 1,
      invoiceRef: "PRE-(D)-(6N)",
      amount: "1000Tnd",
      date: "05 Janvier 2022",
      status: "NR")
];

class _DetailRevenueState extends State<DetailRevenue> {
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
            widget.entree.nom,
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
                  Icons.money,
                  // color: Colors.white,
                ),
              ),
              label: "Finance",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "HR",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Equipment",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Production",
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Invoice Ref",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 8,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 75.0),
                        child: Text(
                          "Amount",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 8,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 77.0),
                        child: Text(
                          "Date",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 8,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 59.0),
                        child: Text(
                          "Status",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 8,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            // GestureDetector(
            //   onTap: null,
            //   child: Container(
            //     child: new Stack(
            //       children: <Widget>[
            //         Container(
            //             height: 63.0,
            //             width: 370,
            //             decoration: new BoxDecoration(
            //                 color: Color(0xff3D385C).withOpacity(0.7),
            //                 shape: BoxShape.rectangle,
            //                 borderRadius: new BorderRadius.circular(15.0),
            //                 boxShadow: <BoxShadow>[
            //                   new BoxShadow(
            //                       color: Colors.black12,
            //                       blurRadius: 10.0,
            //                       offset: new Offset(07.0, 10.0))
            //                 ])),
            //         Container(
            //           margin: EdgeInsets.only(top: 24, left: 10),
            //           child: Text(
            //             "dafdae (def)-(01)",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontFamily: 'Montesserat',
            //                 fontSize: 12,
            //                 fontStyle: FontStyle.normal,
            //                 fontWeight: FontWeight.w400),
            //           ),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(left: 131, top: 24),
            //           child: Text(
            //             "42614 Tnd",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontFamily: 'Montesserat',
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(top: 24, left: 230),
            //           child: Text(
            //             "10 Janvier 2022",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontFamily: 'Montesserat',
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w300),
            //           ),
            //         ),
            //         Container(
            //           margin: EdgeInsets.only(top: 24, left: 345),
            //           child: Text(
            //             "R",
            //             style: TextStyle(
            //                 color: Colors.red,
            //                 fontFamily: 'Montesserat',
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.w500),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
           
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < det.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DetailCard(
                      invoiceRef : det[i].invoiceRef,
                      amount : det[i].amount,
                      date : det[i].date,
                      status: det[i].status,
                      press: () {
                        //          Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return DetailRevenue( entree: Entree[i]);
                        //     },
                        //   ),
                        // );
                        print("pushed");
                      },
                    ),
                  )
              ],
            ),
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
