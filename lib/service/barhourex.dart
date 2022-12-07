import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class statsday {
  final double? Value;
  final String? Time;
  charts.Color? barColor;

  statsday({
    this.Value,
    this.Time,
    this.barColor,
  }) {
    barColor = charts.ColorUtil.fromDartColor(Color.fromARGB(255, 0, 188, 212));
  }
  late double Moy1H = 0;
  late double Moy2H = 0;
  late double Moy3H = 0;
  late double Moy4H = 0;
  late double Moy5H = 0;
  late double Moy6H = 0;
  late double Moy7H = 0;
  late double Moy8H = 0;
  late double Moy9H = 0;
  late double Moy10H = 0;
  late double Moy11H = 0;
  late double Moy12H = 0;
  List<double> f1H = [];
  List<double> f2H = [];
  List<double> f3H = [];
  List<double> f4H = [];
  List<double> f5H = [];
  List<double> f6H = [];
  List<double> f7H = [];
  List<double> f8H = [];
  List<double> f9H = [];
  List<double> f10H = [];
  List<double> f11H = [];
  List<double> f12H = [];
  List<double> moysH1 = [];
  List<double> moysH = [];
  List<int> TimesH = [];
  static List<statsday> data = [];
  Future gethourlyystats() async {
    for (var i = 0; i < 12; i++) {
      var prevhour = new DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, DateTime.now().hour - (2 * i) + 1);
      TimesH.add(prevhour.hour);
    }

    await FirebaseFirestore.instance
        .collection('Temperateur1')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              if ((DateTime.now())
                      .difference(DateTime.parse(element.get('time')))
                      .inHours <
                  24) {
                if (DateTime.parse(element.get('time')).hour == TimesH[11]) {
                  f1H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[10]) {
                  f2H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[9]) {
                  f3H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[8]) {
                  f4H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[7]) {
                  f5H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[6]) {
                  f6H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[5]) {
                  f7H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[4]) {
                  f8H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[3]) {
                  f9H.add(element.get('value'));
                }

                if (DateTime.parse(element.get('time')).hour == TimesH[2]) {
                  f10H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[1]) {
                  f11H.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).hour == TimesH[0]) {
                  f12H.add(element.get('value'));
                }
              }
            }));
    for (var item in f8H) {
      Moy8H = (Moy8H + item);
    }
    for (var item in f1H) {
      Moy1H = (Moy1H + item);
    }
    for (var item in f2H) {
      Moy2H = (Moy2H + item);
    }
    for (var item in f3H) {
      Moy3H = (Moy3H + item);
    }
    for (var item in f4H) {
      Moy4H = (Moy4H + item);
    }
    for (var item in f5H) {
      Moy5H = (Moy5H + item);
    }
    for (var item in f6H) {
      Moy6H = (Moy6H + item);
    }
    for (var item in f7H) {
      Moy7H = (Moy7H + item);
    }
    for (var item in f9H) {
      Moy9H = (Moy9H + item);
    }
    for (var item in f10H) {
      Moy10H = (Moy10H + item);
    }
    for (var item in f11H) {
      Moy11H = (Moy11H + item);
    }
    for (var item in f12H) {
      Moy12H = (Moy12H + item);
    }

    Moy1H = Moy1H / f1H.length;
    Moy2H = Moy2H / f2H.length;
    Moy3H = Moy3H / f3H.length;
    Moy4H = Moy4H / f4H.length;
    Moy5H = Moy5H / f5H.length;
    Moy6H = Moy6H / f6H.length;
    Moy7H = Moy7H / f7H.length;
    Moy8H = Moy8H / f8H.length;
    Moy9H = Moy9H / f9H.length;
    Moy10H = Moy10H / f10H.length;
    Moy11H = Moy11H / f11H.length;
    Moy12H = Moy12H / f12H.length;
    moysH = [
      Moy12H,
      Moy11H,
      Moy10H,
      Moy9H,
      Moy8H,
      Moy7H,
      Moy6H,
      Moy5H,
      Moy4H,
      Moy3H,
      Moy2H,
      Moy1H
    ];
    List<String> kk = [];
    for (var item in TimesH) {
      kk.add("${item}h");
    }
    for (var i = 0; i < moysH.length; i++) {
      if (moysH[i].isNaN) {
        moysH1.add(0);
      } else {
        moysH1.add(moysH[i]);
      }
    }
    data = [
      new statsday(Time: kk[11], Value: moysH1[0]),
      new statsday(Time: kk[10], Value: moysH1[1]),
      new statsday(Time: kk[9], Value: moysH1[2]),
      new statsday(Time: kk[8], Value: moysH1[3]),
      new statsday(Time: kk[7], Value: moysH1[4]),
      new statsday(Time: kk[6], Value: moysH1[5]),
      new statsday(Time: kk[5], Value: moysH1[6]),
      new statsday(Time: kk[4], Value: moysH1[7]),
      new statsday(Time: kk[3], Value: moysH1[8]),
      new statsday(Time: kk[2], Value: moysH1[9]),
      new statsday(Time: kk[1], Value: moysH1[10]),
      new statsday(Time: kk[0], Value: moysH1[11]),
    ];
  }
}

class CustomBarCharthour extends StatelessWidget {
  const CustomBarCharthour({
    Key? key,
    required this.statsdays,
  }) : super(key: key);

  final List<statsday> statsdays;
  @override
  Widget build(BuildContext context) {
    List<charts.Series<statsday, String>> series = [
      charts.Series(
          id: 'hours',
          data: statsdays,
          domainFn: (series, _) => series.Time.toString(),
          measureFn: (series, _) => series.Value,
          colorFn: (series, _) => series.barColor!,
          labelAccessorFn: (statsday sales, _) => '${sales.Value}')
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
