import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_irrigation/service/data.dart';
import 'package:smart_irrigation/service/stats.dart';

import 'package:smart_irrigation/ui/weatherstationpage.dart';
import './ui/LoginPage.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  data a = new data();
  a.req1();
  stats a1 = new stats();
  a1.getmonthlystats;
  runApp(MyApp());

  // Initialize Client and API
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new MaterialApp(
        navigatorKey: navigatorKey,
        title: 'Smart-Irrigation',
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              return Weatherapp3Widget();
            } else {
              return Login();
            }
          },
        ));
  }
}
