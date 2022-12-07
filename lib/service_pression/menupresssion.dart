import 'package:flutter/material.dart';
import 'package:smart_irrigation/service_pression/hourlyui.dart';
import 'package:smart_irrigation/service_pression/weeklyui.dart';
import 'package:smart_irrigation/ui/sign_in_options_screen.dart';
import 'package:smart_irrigation/ui/statscharts.dart';
import 'package:smart_irrigation/ui/weatherstationpage.dart';

import '../ui/Navbar.dart';

import 'monthlyui.dart';

class menupression extends StatefulWidget {
  const menupression({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<menupression> createState() => _menupage();
}

class _menupage extends State<menupression> {
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: const SignInOptionsScreen(),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: true,
        leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_sharp,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => Weatherapp3Widget()))),
      ),
      drawer: Navbar(),
      body: Center(
        child: Container(
            width: 455,
            height: 713,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 132, 255, 1),
                  Color.fromRGBO(0, 132, 255, 1),
                  Color.fromRGBO(0, 132, 255, 1),
                  Color.fromRGBO(77, 169, 255, 1),
                  Color.fromRGBO(255, 255, 255, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            // ignore: unnecessary_new
            child: new Stack(children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 113),
                child: Text(
                  'Pression',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color.fromARGB(255, 2, 82, 35)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140.0, right: 20),
                child: ButtonBar(
                  children: [
                    RaisedButton(
                      child: const Text("Monthly"),
                      textColor: Colors.white,
                      color: const Color.fromARGB(255, 112, 174, 255),
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new menupression(
                                    title: 'Monthly Morneg Statics',
                                  ))),
                    ),
                    RaisedButton(
                      child: const Text("Weekly"),
                      textColor: Colors.white,
                      color: const Color.fromARGB(255, 112, 174, 255),
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new barchatui(
                                    title: 'Weekly Morneg Statics',
                                  ))),
                    ),
                    RaisedButton(
                      child: const Text("Hourly"),
                      textColor: Colors.white,
                      color: const Color.fromARGB(255, 112, 174, 255),
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new barhourui(
                                    title: 'Hourly Morneg Statics',
                                  ))),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 250),
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Center(
                  // ignore: unnecessary_new
                  child: new Container(
                    alignment: Alignment.center,
                    child: const SingleChildScrollView(
                      child: monthlyui(),
                    ),
                  ),
                ),
              )
            ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModalBottomSheet(context),
        tooltip: 'Bottom Sheet',
        child: const Text('''Other 
infos'''),
      ),
    );
  }
}
