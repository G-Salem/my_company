import 'package:flutter/material.dart';
import 'package:my_company/Screens/fico/financialManagement.dart';
import 'package:my_company/Screens/home/home.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';
import 'package:postgres/postgres.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  SharedPreferences prefs;
  
  var connection = new PostgreSQLConnection("www.logimes.com", 5432, "Logimes",
      username: "postgres", password: "admin");
  int _currentIndex = 1;
  int compteur;
  final tabs = [
    FinancialManagement(),
    HomeInside(),
    Center(child: Text("Equipement")),
    Center(child: Text("Products")),
  ];

  _getThingsOnStartup() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
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
          title: Text(
            'Financial Management',
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
            icon: SizedBox(height: size.height * 0.05,
                  child: Icon(
                    Icons.money,
                    // color: Colors.white,
                  ),
                ),
                label: "Finance",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
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
            children: [tabs[_currentIndex]],
          ),
        ),
    
        
        );
  }
}
