import 'package:flutter/material.dart';
import 'package:my_company/Screens/fico/details/outcomes/detailCheque.dart';
import 'package:my_company/Screens/fico/financialManagement.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:my_company/components/detailCardClient.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';

class DetailOutcomeclient extends StatefulWidget {
  final SortiesSupplier sortie;
  const DetailOutcomeclient({Key key, this.sortie}) : super(key: key);

  @override
  State<DetailOutcomeclient> createState() => _DetailOutcomeclientState();
}

List<bool> isSelected;
List<Details> det = [
  Details(
      id: 1,
      invoiceRef: "PRE-(A)-(4N)",
      amount: "1000Tnd",
      date: "12 Janvier 2022",
      status: "R"),
  Details(
      id: 1,
      invoiceRef: "PRE-(F)-(8N)",
      amount: "700Tnd",
      date: "10 Janvier 2022",
      status: "PR"),
  Details(
      id: 1,
      invoiceRef: "PRE-(D)-(6N)",
      amount: "300Tnd",
      date: "05 Janvier 2022",
      status: "NR")
];

class _DetailOutcomeclientState extends State<DetailOutcomeclient> {
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
            widget.sortie.nomClient,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < det.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: DetailCard(
                      invoiceRef: det[i].invoiceRef,
                      amount: det[i].amount,
                      date: det[i].date,
                      status: det[i].status,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailChequesOut(detail: det[i]);
                            },
                          ),
                        );
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

class Details {
  int id;
  String invoiceRef, amount, date, status;

  Details({this.id, this.invoiceRef, this.date, this.amount, this.status});
}
