import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_irrigation/service/data.dart';

class lignchartmonth {
  double Value;
  int Time;
  lignchartmonth(
    this.Value,
    this.Time,
  );
}

////////////////////////////////////////////////////////////
class lignemonth extends StatefulWidget {
  const lignemonth({Key? key}) : super(key: key);

  @override
  State<lignemonth> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<lignemonth> {
  late List<charts.Series<lignchartmonth, int>> _seriesLineData;
  _generateData() {
    var data = [
      new lignchartmonth(1, 5),
      new lignchartmonth(3, 4),
      new lignchartmonth(0, 3),
    ];
    _seriesLineData.add(charts.Series(
        id: 'lignchartmonth',
        data: data,
        domainFn: (lignchartmonth a, _) => a.Time,
        measureFn: (lignchartmonth a, _) => a.Value,
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099))));
  }

  @override
  void initState() {
    super.initState();
    _seriesLineData = <charts.Series<lignchartmonth, int>>[];
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1976d2),
          title: Text('Flutter Charts'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Sales for the first 5 years',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: charts.LineChart(_seriesLineData,
                        defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true, stacked: true),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          new charts.ChartTitle('Years',
                              behaviorPosition: charts.BehaviorPosition.bottom,
                              titleOutsideJustification:
                                  charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle('Sales',
                              behaviorPosition: charts.BehaviorPosition.start,
                              titleOutsideJustification:
                                  charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle(
                            'Departments',
                            behaviorPosition: charts.BehaviorPosition.end,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
