import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_irrigation/service/data.dart';
import 'package:smart_irrigation/service/stats.dart';
import 'package:intl/intl.dart';

class statsMonth {
  final double? Value;
  final String? Time;
  charts.Color? barColor;

  statsMonth({
    this.Value,
    this.Time,
    this.barColor,
  }) {
    barColor = charts.ColorUtil.fromDartColor(Color.fromARGB(255, 0, 188, 212));
  }

  late double Moy1w = 0;
  late double Moy2w = 0;
  late double Moy3w = 0;
  late double Moy4w = 0;
  late double Moy5w = 0;
  late double Moy6w = 0;
  late double Moy7w = 0;
  List<double> moysw = [];
  List<double> moysw1 = [];
  List<double> f1w = [];
  List<double> f2w = [];
  List<double> f3w = [];
  List<double> f4w = [];
  List<double> f5w = [];
  List<double> f6w = [];
  List<double> f7w = [];
  List<String> dd = [];
  List<DateTime> Timesw = [];

  static List<statsMonth> data = [];
  // static var List<statsMonth> data = new List<statsMonth>();

  Future getweeklystats() async {
    for (var i = 0; i < 7; i++) {
      var prevday = new DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day - i);
      Timesw.add(prevday);
    }

    await FirebaseFirestore.instance
        .collection('Temperateur1')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              if (((DateTime.now())
                      .difference(DateTime.parse(element.get('time')))
                      .inDays) <
                  7) {
                if (DateTime.parse(element.get('time')).day == Timesw[6].day) {
                  f1w.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).day == Timesw[5].day) {
                  f2w.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).day == Timesw[4].day) {
                  f3w.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).day == Timesw[3].day) {
                  f4w.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).day == Timesw[2].day) {
                  f5w.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).day == Timesw[1].day) {
                  f6w.add(element.get('value'));
                }
                if (DateTime.parse(element.get('time')).day == Timesw[0].day) {
                  f7w.add(element.get('value'));
                }
              }
            }));
    for (var item in f1w) {
      Moy1w = (Moy1w + item);
    }
    for (var item in f2w) {
      Moy2w = (Moy2w + item);
    }
    for (var item in f3w) {
      Moy3w = (Moy3w + item);
    }
    for (var item in f4w) {
      Moy4w = (Moy4w + item);
    }
    for (var item in f5w) {
      Moy5w = (Moy5w + item);
    }
    for (var item in f6w) {
      Moy6w = (Moy6w + item);
    }
    for (var item in f7w) {
      Moy7w = (Moy7w + item);
    }

    Moy1w = Moy1w / f1w.length;
    Moy2w = Moy2w / f2w.length;
    Moy3w = Moy3w / f3w.length;
    Moy4w = Moy4w / f4w.length;
    Moy5w = Moy5w / f5w.length;
    Moy6w = Moy6w / f6w.length;
    Moy7w = Moy7w / f7w.length;

    moysw = [Moy1w, Moy2w, Moy3w, Moy4w, Moy5w, Moy6w, Moy7w];
    for (var i = 0; i < moysw.length; i++) {
      if (moysw[i].isNaN) {
        moysw1.add(0);
      } else {
        moysw1.add(moysw[i]);
      }
    }
    for (var item in Timesw) {
      dd.add(DateFormat('EEE').format(item));
    }
    data = [
      new statsMonth(Value: moysw1[0], Time: dd[6]),
      new statsMonth(Time: dd[5], Value: moysw1[1]),
      new statsMonth(Time: dd[4], Value: moysw1[2]),
      new statsMonth(Time: dd[3], Value: moysw1[3]),
      new statsMonth(Value: moysw1[4], Time: dd[2]),
      new statsMonth(Value: moysw1[5], Time: dd[1]),
      new statsMonth(Value: moysw1[6], Time: dd[0]),
    ];
  }
}

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({
    Key? key,
    required this.statsMonths,
  }) : super(key: key);

  final List<statsMonth> statsMonths;
  @override
  Widget build(BuildContext context) {
    List<charts.Series<statsMonth, String>> series = [
      charts.Series(
          id: 'orders',
          data: statsMonths,
          domainFn: (series, _) => series.Time.toString(),
          measureFn: (series, _) => series.Value,
          colorFn: (series, _) => series.barColor!,
          labelAccessorFn: (statsMonth sales, _) => '${sales.Value}')
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
