import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'package:smart_irrigation/ui/weatherstationpage.dart';
import '../service/data.dart';
import '../service/valueclass2.dart';
import '../service_precipitation/menuprecipitation.dart';
import '../service_pression/menupresssion.dart';
import 'Navbar.dart';
import 'menupage.dart';
import 'nextpage.dart';

class affich extends StatefulWidget {
  const affich({Key? key}) : super(key: key);

  @override
  State<affich> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<affich> {
  String dT = DateFormat.yMMMd().format(DateTime.now());
  data a = new data();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'WEATHER CERT',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(255, 251, 251, 1),
                fontFamily: 'Roboto',
                fontSize: 24,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.w400,
                height: 1),
          ),
        ),
        drawer: Navbar(),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 132, 255, 1),
                  Color.fromRGBO(255, 255, 255, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Morneg',
                    style: const TextStyle(
                      fontSize: 35,
                      height: 2,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${dT}',
                    style: const TextStyle(
                      fontSize: 16,
                      height: 2,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/Sun.png",
                      height: 150,
                      width: 150,
                    ),
                    Container(
                      height: 50,
                      width: 1.5,
                      color: Colors.grey,
                    ),
                    Container(
                      child: FutureBuilder(
                          future: a.getDocId(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return valueclass2(docuid: a.docIDs.first);
                            } else
                              return CircularProgressIndicator();
                          }),
                    ),
                  ],
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new menupression(
                                      title: 'Monthly Morneg Statics',
                                    )))),
                        child: Container(
                          height: 80,
                          width: 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 222, 222),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset('assets/images/pres.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new menupage(
                                      title: 'Monthly Morneg Statics',
                                    ))),
                        child: Container(
                          height: 80,
                          width: 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 222, 222),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset('assets/images/sun1.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() => null),
                        child: Container(
                          height: 80,
                          width: 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 222, 222),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset('assets/images/hum.png'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 60,
                          child: Text(
                            "Pressure",
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 100,
                          child: Text(
                            "Tempreture",
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 60,
                          child: Text(
                            "Humidity",
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (() => null),
                        child: Container(
                          height: 80,
                          width: 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 222, 222),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset(
                              'assets/images/Icons8_summer_24px_11.png'),
                        ),
                      ),
                      GestureDetector(
                        onTap: (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new menuprecipitation(
                                      title: 'Monthly Morneg Statics',
                                    )))),
                        child: Container(
                          height: 80,
                          width: 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 222, 222),
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset(
                              'assets/images/Icons8_moisture_50px_11.png'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 20,
                          width: 120,
                          child: Text(
                            "Solar Radiation",
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 120,
                          child: Text(
                            "Precipitations amounts",
                            style: const TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                ]),
                SizedBox(height: 100),
                Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      '@Copyright CERT 2022',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
