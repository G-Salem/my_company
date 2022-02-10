import 'package:flutter/material.dart';
import 'package:my_company/Screens/fico/financialManagement.dart';
import 'package:my_company/Screens/others/notification.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:my_company/components/detailCardProduit.dart';
import 'package:my_company/constants.dart';
import 'package:my_company/layouts/navBar.dart';

class DetailOutcomeProduit extends StatefulWidget {
  final SortiesProd sortie;
  DetailOutcomeProduit({Key key, this.sortie}) : super(key: key);

  @override
  State<DetailOutcomeProduit> createState() => _DetailOutcomeProduitState();
}

List<bool> isSelected;
List<DetailsProd> det = [
  DetailsProd(
      id: 1,
      nom: "Yaought Normal",
      quantite: "5000",
      date: "12 Janvier 2022",
      prix: "2000 Tnd"),
  DetailsProd(
      id: 2,
      nom: "Fromage",
      quantite: "400",
      date: "12 Janvier 2022",
      prix: "4000 Tnd"),
  DetailsProd(
      id: 3,
      nom: "lait",
      quantite: "150",
      date: "12 Janvier 2022",
      prix: "1050 Tnd"),
  DetailsProd(
      id: 4,
      nom: "Rayeb",
      quantite: "475",
      date: "12 Janvier 2022",
      prix: "950 Tnd"),
];

class _DetailOutcomeProduitState extends State<DetailOutcomeProduit> {
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
            widget.sortie.nomProd,
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
                  Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: DetailCardProduitt(
                        nom: det[i].nom,
                        prix: det[i].prix,
                      )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsProd {
  int id;
  String nom, quantite, date, prix;

  DetailsProd({this.id, this.nom, this.date, this.quantite, this.prix});
}
