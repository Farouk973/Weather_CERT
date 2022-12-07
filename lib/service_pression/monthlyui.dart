import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_irrigation/service_pression/monthly.dart';

class monthlyui extends StatefulWidget {
  const monthlyui({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<monthlyui> {
  late int showingTooltip;

  @override
  void initState() {
    showingTooltip = -1;
    super.initState();
  }

  monthly s = new monthly();

  BarChartGroupData generateGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [
        BarChartRodData(toY: y),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: s.getmonthlystats(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
                aspectRatio: 1.4,
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      generateGroupData(s.Times[11], s.moys[11]),
                      generateGroupData(s.Times[10], s.moys[10]),
                      generateGroupData(s.Times[9], s.moys[9]),
                      generateGroupData(s.Times[8], s.moys[8]),
                      generateGroupData(s.Times[7], s.moys[7]),
                      generateGroupData(s.Times[6], s.moys[6]),
                      generateGroupData(s.Times[5], s.moys[5]),
                      generateGroupData(s.Times[4], s.moys[4]),
                      generateGroupData(s.Times[3], s.moys[3]),
                      generateGroupData(s.Times[2], s.moys[2]),
                      generateGroupData(s.Times[1], s.moys[1]),
                      generateGroupData(s.Times[0], s.moys[0]),
                    ],
                    barTouchData: BarTouchData(
                        enabled: true,
                        handleBuiltInTouches: true,
                        touchCallback: (event, response) {
                          if (response != null &&
                              response.spot != null &&
                              event is FlTapUpEvent) {
                            setState(() {
                              final x = response.spot!.touchedBarGroup.x;
                              final isShowing = showingTooltip == x;
                              if (isShowing) {
                                showingTooltip = -1;
                              } else {
                                showingTooltip = x;
                              }
                            });
                          }
                        },
                        mouseCursorResolver: (event, response) {
                          return response == null || response.spot == null
                              ? MouseCursor.defer
                              : SystemMouseCursors.click;
                        }),
                  ),
                ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
