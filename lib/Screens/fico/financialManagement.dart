import 'package:flutter/material.dart';
import 'package:my_company/Screens/fico/details/detailRevenue.dart';
import 'package:my_company/Screens/sign_up/register2.dart';
import 'package:my_company/components/financeCard.dart';
import 'package:my_company/constants.dart';

class FinancialManagement extends StatefulWidget {
  @override
  State<FinancialManagement> createState() => _FinancialManagementState();
}

List<bool> isSelected;

List<Entrees> Entree = [
  Entrees(
      id: 1, nom: "Delice Danone", date: "10 Janvier 2022", money: "6000 Tnd"),
  Entrees(id: 2, nom: "Saida", date: "09 Janvier 2022", money: "3000 Tnd"),
  Entrees(id: 3, nom: "l'epi d'or", date: "07 Janvier 2022", money: "1000 Tnd"),
  Entrees(id: 4, nom: "Saida", date: "06 Janvier 2022", money: "1000 Tnd"),
  Entrees(id: 5, nom: "Coca Cola", date: "04 Janvier 2022", money: "2000 Tnd"),
  Entrees(
      id: 6, nom: "Delice Danone", date: "01 Janvier 2022", money: "5000 Tnd"),
  Entrees(id: 7, nom: "l'epi d'or", date: "01 Janvier 2022", money: "1000 Tnd"),
  Entrees(id: 8, nom: "Saida", date: "01 Janvier 2022", money: "1000 Tnd"),
];

class _FinancialManagementState extends State<FinancialManagement> {
  @override
  void initState() {
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
              width: 350,
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
                splashColor: Color(0xff6C6884),
                borderRadius: BorderRadius.circular(9.8),
                renderBorder: false,
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
                      }
                    },
                  );
                },
              ),
            ),
          ),
          Column(
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
                          shape: StadiumBorder(),
                          side: BorderSide(
                            width: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: null,
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
                          shape: StadiumBorder(),
                          side: BorderSide(
                            width: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: null,
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (var i = 0; i < Entree.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FinanceCard(
                        title: Entree[i].nom,
                        date: Entree[i].date,
                        money: Entree[i].money,
                        press: (){
                           Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailRevenue(entree: Entree[i]);
                      },
                    ),
                  );
                        },
                      ),
                    )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Entrees {
  int id;
  String nom;
  String date;
  String money;

  Entrees({this.id, this.nom, this.date, this.money});
}
