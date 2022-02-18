import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';

class AllNotifs extends StatefulWidget {
  @override
  State<AllNotifs> createState() => _AllNotifsState();
}

class _AllNotifsState extends State<AllNotifs> {
  TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Notification".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
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
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 70,
      //   currentIndex: _currentIndex,
      //   type: BottomNavigationBarType.fixed,
      //   // selectedItemColor: Colors.white,
      //   selectedItemColor: kSecondaryColor,
      //   unselectedItemColor: Colors.grey,
      //   backgroundColor: kBottomColor,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: SizedBox(
      //           height: size.height * 0.05,
      //           child: Icon(
      //             Boxicons.bx_wallet, size: 30,
      //             // color: Colors.white,
      //           ),
      //         ),
      //         label: "Finance",
      //         backgroundColor: Colors.white),
      //     BottomNavigationBarItem(
      //       icon: Icon(Boxicons.bx_user, size: 30),
      //       label: "HR",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Boxicons.bxs_box, size: 30),
      //       label: "Stock",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Boxicons.bx_home, size: 30),
      //       label: "Home",
      //     ),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),

      backgroundColor: kInsideColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
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
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.4),
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            SizedBox(height: size.height * 0.1),
            GestureDetector(
              onTap: null,
              child: Container(
                child: new Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                          height: 163.0,
                          width: 370,
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
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 24, left: 30),
                        child: Icon(
                          Boxicons.bxs_check_circle,
                          color: Colors.white,
                          size: 50,
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 100, top: 24, right: 50),
                      child: Text(
                        "Invoice number 124651 succefully done",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montesserat',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            GestureDetector(
              onTap: null,
              child: Container(
                child: new Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                          height: 163.0,
                          width: 370,
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
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 24, left: 30),
                        child: Icon(
                          Boxicons.bx_error_circle,
                          color: Colors.red,
                          size: 50,
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 100, top: 24, right: 50),
                      child: Text(
                        "The deadline of the invoice number 995544 is due to tommorw please don't forget to get it done !!!!!",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montesserat',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
