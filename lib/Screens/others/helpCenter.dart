import 'package:flutter/material.dart';
import '../../constants.dart';

class HelpCenter extends StatefulWidget {
  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _currentIndex;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.12),
              Padding(
                padding: const EdgeInsets.all(90.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.help_center,
                      color: Colors.white,
                    ),
                    Text(
                      "Help Center",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.normal,
                          color: kPrimaryLightColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.4),
                      ),
                      labelText: "Search",
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: "Search",
                      suffixIcon: Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.4),
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 70,
          currentIndex: 1,
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
        ));
  }
}


                      // final a=await connection.execute("SELECT \"NomSociete\" FROM public.\"SaiSoc\" WHERE \"MatFiscale\" = \"123456/A/A/000\"" ) ;
