import 'package:flutter/material.dart';
import '../../constants.dart';

class Configuration extends StatefulWidget {
  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  List languages = ["Arabic", "French", "English"];
  List images = ["assets/tun.png", "assets/fr.png", "assets/uk.png"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.12),
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.public,
                      color: Colors.white,
                    ),
                    Text(
                      "Languages",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.normal,
                          color: kPrimaryLightColor),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Card(
                    elevation: 5.0,
                    color: kInsideColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(30.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 15.0 ),

                              Column(
                                children: [
                              SizedBox(height: 13.0 ),

                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    child: Image.asset(images[index]),
                                  ),
                                ],
                              ),
                              SizedBox(width: 35.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: size.height * 0.025),
                                  Center(
                                      child: Text(
                                    languages[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ],
                              )
                            ]),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: FlatButton(
                              onPressed: () {},
                              color: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text("Choose",
                                  style: TextStyle(color: Colors.white))),
                          //^^^^^^^^^^^^^^^^^^^^^^
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        );
  }
}


                      // final a=await connection.execute("SELECT \"NomSociete\" FROM public.\"SaiSoc\" WHERE \"MatFiscale\" = \"123456/A/A/000\"" ) ;
