import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_irrigation/service/data.dart';
import 'package:smart_irrigation/service/dataclass.dart';

import 'Navbar.dart';

var a = new data();

class page1 extends StatefulWidget {
  @override
  _page1 createState() => _page1();
}

class _page1 extends State<page1> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: a.getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: a.docIDs.length,
                    itemBuilder: (context, index) {
                      return Card(
                          color: Color.fromARGB(255, 70, 133, 164),
                          elevation: 9,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: dataclass(docuid: a.docIDs[index]),
                          ));
                    });
              },
            ),
          )
        ],
      ),
    ));
  }
}
