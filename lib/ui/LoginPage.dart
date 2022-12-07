import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:smart_irrigation/main.dart';
import 'package:smart_irrigation/ui/mapPage.dart';
import 'package:smart_irrigation/ui/menupage.dart';
import 'package:smart_irrigation/ui/weatherstationpage.dart';
import 'nextpage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Username',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black87, fontSize: 17),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Color(0xff5ac18e),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildbuttomlogin() {
    return Column(
      children: [
        MaterialButton(
            height: 58,
            minWidth: 240,
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12)),
            onPressed: signIn,
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }

  Widget buildbuttomlogin2() {
    return Column(
      children: [
        MaterialButton(
            height: 58,
            minWidth: 240,
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12)),
            onPressed: () {},
            child: Center(
              child: Text(
                'Enter As Guest',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _obscuretexts = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            Container(
                width: 455,
                height: 713,
                decoration: BoxDecoration(
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
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 414,
                          height: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/Image4.png'),
                                fit: BoxFit.fitHeight),
                          ))),
                  Positioned(
                      //effet image
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 414,
                          height: 350,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromRGBO(255, 255, 255, 0),
                                  Color.fromRGBO(78, 170, 255, 1)
                                ]),
                          ))),
                  Positioned(
                      top: 150,
                      left: 62,
                      child: Text(
                        'Weather Cert',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 251, 251, 1),
                            fontFamily: 'Roboto',
                            fontSize: 48,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Welcome to weather Cert',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 251, 251, 1),
                            fontFamily: 'Roboto',
                            fontSize: 17,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: buildUsername(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2))
                                  ]),
                              height: 60,
                              child: TextField(
                                controller: passwordController,
                                obscureText: _obscuretexts,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 17),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xff5ac18e),
                                  ),
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscuretexts = !_obscuretexts;
                                        });
                                      },
                                      child: Icon(Icons.visibility)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, right: 20, left: 20),
                        child: buildbuttomlogin(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 20,
                          left: 20,
                        ),
                        child: Column(
                          children: [
                            MaterialButton(
                                height: 58,
                                minWidth: 240,
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(12)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Weatherapp3Widget()));
                                },
                                child: Center(
                                  child: Text(
                                    'Enter As Guest',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 100, bottom: 40),
                        child: Row(
                          children: [
                            Text(
                              'Forget',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' Username',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                            Text(
                              ' or ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Password?',
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '@Copyright CERT',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ])),
          ],
        ),
      ),
    );
    ;
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
