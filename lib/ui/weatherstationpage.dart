import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:smart_irrigation/main.dart';
import 'package:smart_irrigation/service/data.dart';
import 'package:smart_irrigation/ui/affich.dart';
import '../service/dataclass.dart';
import '../service/valueclass.dart';
import 'menupage.dart';
import 'navbardisabled.dart';

class Weatherapp3Widget extends StatefulWidget {
  @override
  State<Weatherapp3Widget> createState() => _Weatherapp3WidgetState();
}

class _Weatherapp3WidgetState extends State<Weatherapp3Widget> {
  data a = data();
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  TextEditingController textController = TextEditingController();

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
      drawer: navbardisabled(),
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
              AnimSearchBar(
                width: 400,
                textController: textController,
                onSuffixTap: () {
                  setState(() {
                    textController.clear();
                  });
                },
                color: Color.fromARGB(255, 0, 170, 255),
                helpText: "Search Text...",
                autoFocus: true,
                closeSearchOnSuffixTap: true,
                animationDurationInMilli: 1000,
                rtl: true,
              ),
              ElevatedButton.icon(
                  label: FutureBuilder(
                      future: a.getDocId(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return valueclass(docuid: a.docIDs.first);
                        } else
                          return Text('Loading'); //CircularProgressIndicator();
                      }),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new affich())),
                  icon: Icon(Icons.sunny),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      fixedSize: Size(320, 140),
                      shadowColor: Color.fromARGB(255, 240, 240, 240),
                      side: BorderSide(
                          color: Color.fromARGB(255, 44, 100, 196), width: 2),
                      textStyle: TextStyle(fontSize: 20))),
              const SizedBox(height: 40),
              ElevatedButton(
                  child: const Text('''
      Station Klibia
IS NOT ACTIVE YET'''),
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      fixedSize: Size(320, 140),
                      shadowColor: Color.fromARGB(255, 240, 240, 240),
                      side: BorderSide(
                          color: Color.fromARGB(255, 44, 100, 196), width: 2),
                      textStyle: TextStyle(fontSize: 20))),
              const SizedBox(height: 40),
              ElevatedButton(
                  child: const Text('''
  Station Zaghwen
IS NOT ACTIVE YET'''),
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      fixedSize: Size(320, 140),
                      shadowColor: Color.fromARGB(255, 240, 240, 240),
                      side: BorderSide(
                          color: Color.fromARGB(255, 44, 100, 196), width: 2),
                      textStyle: TextStyle(fontSize: 20))),
              Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    '@Copyright CERT 2022',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    ));
  }
}
