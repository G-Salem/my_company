import 'package:flutter/material.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';

class RevenuesList extends StatefulWidget {
  @override
  State<RevenuesList> createState() => _RevenuesListState();
}

class _RevenuesListState extends State<RevenuesList> {
  List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false];
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Revenues',
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
            SizedBox(height: size.height * 0.1),
            Column(
              children: [
                ToggleButtons(
                    textStyle: TextStyle(
                        fontFamily: 'Montesserat',
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                    isSelected: isSelected,
                    
                    selectedColor: kSecondaryColor,
                    fillColor: Colors.transparent,
                    renderBorder: false,
                    color: Colors.white,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(" Clients "),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Products"),
                      ),
                    ],
                    onPressed: (index) {
                      setState(() {
                        for (var i = 0; i < isSelected.length; i++) {
                        isSelected[i] = !isSelected[i];
                        }
                      });
                    }),
              ],
            ),
            SizedBox(height: size.height * 0.1),
            //   FinanceCard(
            //     title: "REVENUES",
            //     money: "6000DT",
            //     inMoney: true,
            //     press: () => {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) {
            //             return Register2();
            //           },
            //         ),
            //       )
            //     },
            //   ),
            //   FinanceCard(
            //     title: "SPENT",
            //     money: "1500DT",
            //     inMoney: false,
            //     press: () => {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) {
            //             return Register2();
            //           },
            //         ),
            //       )
            //     },
            //   ),
            // ],
          ],
        ),
      ),
      //),
    );
  }
}
