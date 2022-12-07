import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class monthlypre {
  List<double> f8 = [];
  List<double> f1 = [];
  List<double> f2 = [];
  List<double> f3 = [];
  List<double> f4 = [];
  List<double> f5 = [];
  List<double> f6 = [];
  List<double> f7 = [];
  List<double> f9 = [];
  List<double> f10 = [];
  List<double> f11 = [];
  List<double> f12 = [];
  late double Moy8 = 0;
  late double Moy1 = 0;
  late double Moy2 = 0;
  late double Moy3 = 0;
  late double Moy4 = 0;
  late double Moy5 = 0;
  late double Moy6 = 0;
  late double Moy7 = 0;
  late double Moy9 = 0;
  late double Moy10 = 0;
  late double Moy11 = 0;
  late double Moy12 = 0;
  List<double> moys = [];
  List<int> Times = [];
  List<String> dd = [];

  Future getmonthlystats() async {
    for (var i = 0; i < 12; i++) {
      var prevMonth = new DateTime(
          DateTime.now().year, DateTime.now().month - i, DateTime.now().day);
      Times.add(prevMonth.month);
    }

    await FirebaseFirestore.instance
        .collection('precipitations1')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              if (DateTime.now()
                      .difference((DateTime.parse(element.get('time'))))
                      .inDays <
                  365) {
                if (DateTime.parse(element.get('time')).month == Times[11]) {
                  f1.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[10]) {
                  f2.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[9]) {
                  f3.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[8]) {
                  f4.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[7]) {
                  f5.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[6]) {
                  f6.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[5]) {
                  f7.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[4]) {
                  f8.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[3]) {
                  f9.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[2]) {
                  f10.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[1]) {
                  f11.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).month == Times[0]) {
                  f12.add(element.get('value'));
                }
              }
            }));
    for (var item in f8) {
      Moy8 = (Moy8 + item);
    }
    for (var item in f1) {
      Moy1 = (Moy1 + item);
    }
    for (var item in f2) {
      Moy2 = (Moy2 + item);
    }
    for (var item in f3) {
      Moy3 = (Moy3 + item);
    }
    for (var item in f4) {
      Moy4 = (Moy4 + item);
    }
    for (var item in f5) {
      Moy5 = (Moy5 + item);
    }
    for (var item in f6) {
      Moy6 = (Moy6 + item);
    }
    for (var item in f7) {
      Moy7 = (Moy7 + item);
    }
    for (var item in f9) {
      Moy9 = (Moy9 + item);
    }
    for (var item in f10) {
      Moy10 = (Moy10 + item);
    }
    for (var item in f11) {
      Moy11 = (Moy11 + item);
    }
    for (var item in f12) {
      Moy12 = (Moy12 + item);
    }

    Moy1 = Moy1 / f1.length;
    Moy2 = Moy2 / f2.length;
    Moy3 = Moy3 / f3.length;
    Moy4 = Moy4 / f4.length;
    Moy5 = Moy5 / f5.length;
    Moy6 = Moy6 / f6.length;
    Moy7 = Moy7 / f7.length;
    Moy8 = Moy8 / f8.length;
    Moy9 = Moy9 / f9.length;
    Moy10 = Moy10 / f10.length;
    Moy11 = Moy11 / f11.length;
    Moy12 = Moy12 / f12.length;
    moys = [
      Moy12,
      Moy11,
      Moy10,
      Moy9,
      Moy8,
      Moy7,
      Moy6,
      Moy5,
      Moy4,
      Moy3,
      Moy2,
      Moy1
    ];

    for (var i = 0; i < 12; i++) {
      if (moys[i].isNaN) {
        moys[i] = 0;
      }
    }
  }
}
