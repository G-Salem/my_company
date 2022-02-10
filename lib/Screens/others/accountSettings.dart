import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';

class AccountSetting extends StatefulWidget {
  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Account Setting',
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
        child: Text("Contenu houni "),
      ),
    );
  }
}
