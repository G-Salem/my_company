// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_company/Screens/fico/details/outcomes/detailOutcomeClient.dart';
import 'package:my_company/Screens/fico/details/outcomes/detailOutcomeProduit.dart';
import 'package:my_company/Screens/fico/details/revenues/detailRevenueClient.dart';
import 'package:my_company/Screens/fico/details/revenues/detailRevenueProduit.dart';
import 'package:my_company/components/financeCard.dart';
import 'package:my_company/constants.dart';

class FinancialManagement extends StatefulWidget {
  @override
  State<FinancialManagement> createState() => _FinancialManagementState();
}

List<bool> isSelected;
String sortBy;

List<EntreesClient> EntreeClients = [
  EntreesClient(
      idClient: 1,
      nomClient: "Delice Danone",
      dateClient: "10 Janvier 2022",
      moneyClient: "6000 Tnd"),
  EntreesClient(
      idClient: 2,
      nomClient: "SaidClienta",
      dateClient: "09 Janvier 2022",
      moneyClient: "3000 Tnd"),
  EntreesClient(
      idClient: 3,
      nomClient: "l'epi d'or",
      dateClient: "07 Janvier 2022",
      moneyClient: "1000 Tnd"),
  EntreesClient(
      idClient: 4,
      nomClient: "Saida",
      dateClient: "06 Janvier 2022",
      moneyClient: "1000 Tnd"),
  EntreesClient(
      idClient: 5,
      nomClient: "Coca Cola",
      dateClient: "04 Janvier 2022",
      moneyClient: "2000 Tnd"),
  EntreesClient(
      idClient: 6,
      nomClient: "Delice Danone",
      dateClient: "01 Janvier 2022",
      moneyClient: "5000 Tnd"),
  EntreesClient(
      idClient: 7,
      nomClient: "l'epi d'or",
      dateClient: "01 Janvier 2022",
      moneyClient: "1000 Tnd"),
  EntreesClient(
      idClient: 8,
      nomClient: "Saida",
      dateClient: "01 Janvier 2022",
      moneyClient: "1000 Tnd"),
];

List<EntreesProd> EntreeProduits = [
  EntreesProd(
      idProd: 1,
      nomProd: "Yaought",
      dateProd: "10 Janvier 2022",
      moneyProd: "6000 Tnd"),
  EntreesProd(
      idProd: 2,
      nomProd: "Biscuit",
      dateProd: "09 Janvier 2022",
      moneyProd: "3000 Tnd"),
  EntreesProd(
      idProd: 3,
      nomProd: "Pasta",
      dateProd: "07 Janvier 2022",
      moneyProd: "1000 Tnd"),
  EntreesProd(
      idProd: 4,
      nomProd: "Buiscuit",
      dateProd: "06 Janvier 2022",
      moneyProd: "1000 Tnd"),
  EntreesProd(
      idProd: 5,
      nomProd: "Jus",
      dateProd: "04 Janvier 2022",
      moneyProd: "2000 Tnd"),
  EntreesProd(
      idProd: 6,
      nomProd: "Lait",
      dateProd: "01 Janvier 2022",
      moneyProd: "5000 Tnd"),
  EntreesProd(
      idProd: 7,
      nomProd: "Fromage",
      dateProd: "01 Janvier 2022",
      moneyProd: "1000 Tnd"),
  EntreesProd(
      idProd: 8,
      nomProd: "Chokotom",
      dateProd: "01 Janvier 2022",
      moneyProd: "1000 Tnd"),
];

List<SortiesSupplier> SortieClients = [
  SortiesSupplier(
      idClient: 1,
      nomClient: "Delice Danone",
      dateClient: "10 Janvier 2022",
      moneyClient: "2000 Tnd"),
  SortiesSupplier(
      idClient: 2,
      nomClient: "SaidClienta",
      dateClient: "09 Janvier 2022",
      moneyClient: "1700 Tnd"),
  SortiesSupplier(
      idClient: 3,
      nomClient: "l'epi d'or",
      dateClient: "07 Janvier 2022",
      moneyClient: "1300 Tnd"),
  SortiesSupplier(
      idClient: 4,
      nomClient: "Saida",
      dateClient: "06 Janvier 2022",
      moneyClient: "1000 Tnd"),
  SortiesSupplier(
      idClient: 5,
      nomClient: "Coca Cola",
      dateClient: "04 Janvier 2022",
      moneyClient: "2000 Tnd"),
  SortiesSupplier(
      idClient: 6,
      nomClient: "Delice Danone",
      dateClient: "01 Janvier 2022",
      moneyClient: "500 Tnd"),
  SortiesSupplier(
      idClient: 7,
      nomClient: "l'epi d'or",
      dateClient: "01 Janvier 2022",
      moneyClient: "500 Tnd"),
];

List<SortiesProd> SortieProduits = [
  SortiesProd(
      idProd: 1,
      nomProd: "Yaought",
      dateProd: "10 Janvier 2022",
      moneyProd: "2000 Tnd"),
  SortiesProd(
      idProd: 2,
      nomProd: "Biscuit",
      dateProd: "09 Janvier 2022",
      moneyProd: "2000 Tnd"),
  SortiesProd(
      idProd: 3,
      nomProd: "Pasta",
      dateProd: "07 Janvier 2022",
      moneyProd: "1700 Tnd"),
  SortiesProd(
      idProd: 4,
      nomProd: "Buiscuit",
      dateProd: "06 Janvier 2022",
      moneyProd: "1300 Tnd"),
  SortiesProd(
      idProd: 5,
      nomProd: "Jus",
      dateProd: "04 Janvier 2022",
      moneyProd: "1000 Tnd"),
  SortiesProd(
      idProd: 6,
      nomProd: "Lait",
      dateProd: "01 Janvier 2022",
      moneyProd: "500 Tnd"),
  SortiesProd(
      idProd: 7,
      nomProd: "Fromage",
      dateProd: "01 Janvier 2022",
      moneyProd: "500 Tnd"),
];

class _FinancialManagementState extends State<FinancialManagement> {
  @override
  void initState() {
    sortBy = "";
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Center(
            child: Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.8),
                color: Color(0xff2E2B42),
              ),
              child: ToggleButtons(
                textStyle: TextStyle(
                    fontFamily: 'Montesserat',
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
                isSelected: isSelected,
                selectedColor: Colors.white,
                borderRadius: BorderRadius.circular(9.8),
                renderBorder: false,
                fillColor: Color(0xff6C6884),
                color: Colors.white,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(" Revenue (20 000) "),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text("Spent (9 000) "),
                  ),
                ],
                onPressed: (index) {
                  setState(
                    () {
                      for (var i = 0; i < isSelected.length; i++) {
                        isSelected[i] = !isSelected[i];
                        print(isSelected);
                      }
                    },
                  );
                },
              ),
            ),
          ),
          isSelected[0] == true
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 28),
                      child: Row(
                        children: [
                          Text("Sort By  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montesserat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: sortBy == ""
                                    ? Color(0xffD2BBFF).withOpacity(0.2)
                                    : kInsideColor,
                                shape: StadiumBorder(),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => {
                                setState(
                                  () {
                                    sortBy = "";
                                  },
                                )
                              },
                              child: Text("Clients",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montesserat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: sortBy == "Products"
                                    ? Color(0xffD2BBFF).withOpacity(0.2)
                                    : kInsideColor,
                                shape: StadiumBorder(),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => {
                                setState(
                                  () {
                                    sortBy = "Products";
                                  },
                                )
                              },
                              child: Text("Products",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montesserat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sortBy == "Products"
                        ? showFinanceByProducts(context, size)
                        : showFinanceByClient(context, size),
                  ],
                )
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 28),
                      child: Row(
                        children: [
                          Text("Sort By  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montesserat',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: sortBy == ""
                                    ? Color(0xffD2BBFF).withOpacity(0.2)
                                    : kInsideColor,
                                shape: StadiumBorder(),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => {
                                setState(
                                  () {
                                    sortBy = "";
                                  },
                                )
                              },
                              child: Text("Suppliers",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montesserat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: sortBy == "Products"
                                    ? Color(0xffD2BBFF).withOpacity(0.2)
                                    : kInsideColor,
                                shape: StadiumBorder(),
                                side: BorderSide(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => {
                                setState(
                                  () {
                                    sortBy = "Products";
                                  },
                                )
                              },
                              child: Text("Products",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montesserat',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    sortBy == "Products"
                        ? showOutcomeByProducts(context, size)
                        : showOutcomeBySuppliers(context, size),
                  ],
                )
        ],
      ),
    );
  }
}

Widget showFinanceByClient(BuildContext context, Size size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      for (var i = 0; i < EntreeClients.length; i++)
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: FinanceCard(
            title: EntreeClients[i].nomClient,
            date: EntreeClients[i].dateClient,
            money: EntreeClients[i].moneyClient,
            press: () {
              print(size.width);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailRevenueClient(entree: EntreeClients[i]);
                  },
                ),
              );
            },
          ),
        )
    ],
  );
}

Widget showFinanceByProducts(BuildContext context, Size size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      for (var i = 0; i < EntreeProduits.length; i++)
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: FinanceCard(
            title: EntreeProduits[i].nomProd,
            date: EntreeProduits[i].dateProd,
            money: EntreeProduits[i].moneyProd,
            press: () {
              print(size.width);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailRevenueProduit(entree: EntreeProduits[i]);
                  },
                ),
              );
            },
          ),
        )
    ],
  );
}

Widget showOutcomeBySuppliers(BuildContext context, Size size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      for (var i = 0; i < SortieClients.length; i++)
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: FinanceCard(
            title: SortieClients[i].nomClient,
            date: SortieClients[i].dateClient,
            money: SortieClients[i].moneyClient,
            press: () {
              print(size.width);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailOutcomeclient(sortie: SortieClients[i]);
                  },
                ),
              );
            },
          ),
        )
    ],
  );
}

Widget showOutcomeByProducts(BuildContext context, Size size) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      for (var i = 0; i < SortieProduits.length; i++)
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: FinanceCard(
            title: SortieProduits[i].nomProd,
            date: SortieProduits[i].dateProd,
            money: SortieProduits[i].moneyProd,
            press: () {
              print(size.width);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailOutcomeProduit(sortie: SortieProduits[i]);
                  },
                ),
              );
            },
          ),
        )
    ],
  );
}



class EntreesClient {
  int idClient;
  String nomClient;
  String dateClient;
  String moneyClient;

  EntreesClient(
      {this.idClient, this.nomClient, this.dateClient, this.moneyClient});
}

class EntreesProd {
  int idProd;
  String nomProd;
  String dateProd;
  String moneyProd;

  EntreesProd({this.idProd, this.nomProd, this.dateProd, this.moneyProd});
}


class SortiesSupplier {
  int idClient;
  String nomClient;
  String dateClient;
  String moneyClient;

  SortiesSupplier(
      {this.idClient, this.nomClient, this.dateClient, this.moneyClient});
}

class SortiesProd {
  int idProd;
  String nomProd;
  String dateProd;
  String moneyProd;

  SortiesProd({this.idProd, this.nomProd, this.dateProd, this.moneyProd});
}
