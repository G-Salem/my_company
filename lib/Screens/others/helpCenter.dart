import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:my_company/layouts/navBar.dart';
import '../../constants.dart';

class HelpCenter extends StatefulWidget {
  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _currentIndex;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Help Center',
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
      backgroundColor: kInsideColor,
     body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.22),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Row(
                children: [
                  Text(
                    "Looking for something ",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.0,
                        fontWeight: FontWeight.normal,
                        color: kPrimaryLightColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: TextField(
                controller: searchEditingController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    labelText: "Search",
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.4),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


                      // final a=await connection.execute("SELECT \"NomSociete\" FROM public.\"SaiSoc\" WHERE \"MatFiscale\" = \"123456/A/A/000\"" ) ;
