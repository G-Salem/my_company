import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_company/Screens/fico/financialManagement.dart';
import 'package:my_company/Screens/home/home.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  SharedPreferences prefs;
  int _currentIndex = 3;
  int compteur;
  String title = "Home";
  final titleAppBar = ["financial Management", "HR", "Products", "Home"];
  final tabs = [
    FinancialManagement(),
    Center(child: Text("Equipement")),
    Center(child: Text("Products")),
    HomeInside(),
  ];

  _getThingsOnStartup() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    compteur = await prefs.getInt("compteur");
    // shared prefs ennajmou enna7iwha w n7ottouha fel navbar()
  }

  @override
  void initState() {
    _getThingsOnStartup().then((value) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              title.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
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
          BottomNavigationBarItem(
            icon: Icon(Boxicons.bx_home, size: 30),
            label: "Home",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            title = titleAppBar[_currentIndex];
          });
        },
      ),
      backgroundColor: kInsideColor,
      body: SingleChildScrollView(
        child: Column(
          children: [tabs[_currentIndex]],
        ),
      ),
    );
  }
}
