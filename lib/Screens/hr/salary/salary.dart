import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import 'package:my_company/Screens/fico/details/revenues/detailCheque.dart';
import 'package:my_company/Screens/fico/financialManagement.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:my_company/components/detailCardClient.dart';
import 'package:my_company/components/humainRessourcesCard.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';

class Salary extends StatefulWidget {
  @override
  State<Salary> createState() => _SalaryState();
}

List<bool> isSelected;

List<HrDet> det = [
  HrDet(id: 1, name: "Amine Gharbi", amount: "1850", date: "29/01/2022"),
  HrDet(id: 1, name: "Skander Amri", amount: "1850", date: "29/01/2022"),
  HrDet(id: 1, name: "Salma Ouni", amount: "1600", date: "28/01/2022"),
  HrDet(id: 1, name: "Salem Gabsi", amount: "1850", date: "28/01/2022"),
  HrDet(id: 1, name: "Marwen Hliwoui", amount: "2000", date: "28/01/2022"),
  HrDet(id: 1, name: "Dorsaf Gharbi", amount: "2500", date: "28/01/2022"),
];

class _SalaryState extends State<Salary> {
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Salary",
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < det.length; i++)
                  HumainRessourcesCard(
                    nom: det[i].name,
                    amount: det[i].amount,
                    date: det[i].date,
                  ),
              ],
            ),

            SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}

class HrDet {
  int id;
  String name, amount, date;
  HrDet({this.id, this.date, this.amount, this.name});
}
