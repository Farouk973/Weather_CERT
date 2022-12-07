import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

import 'package:intl/intl.dart';

class csv extends StatefulWidget {
  const csv({Key? key}) : super(key: key);

  @override
  State<csv> createState() => _csvState();
}

class _csvState extends State<csv> {
  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd, MMMM yyyy').format(today).toString();
    _endDate = DateFormat('dd, MMMM yyyy')
        .format(today.add(Duration(days: 3)))
        .toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      SfDateRangePicker(
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged: _onselectionchanged,
      ),
      SizedBox(
        height: 10,
      ),
      Center(
        child: ElevatedButton(
          child: Text('create Excel'),
          onPressed: (() => createExcel(_startDate, _endDate)),
        ),
      ),
    ]));
  }

  void _onselectionchanged(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    setState(() {
      _startDate = DateFormat('dd, MMMM yyyy')
          .format(dateRangePickerSelectionChangedArgs.value.startDate);
      _endDate = DateFormat('dd, MMMM yyyy')
          .format(dateRangePickerSelectionChangedArgs.value.endDate ??
              dateRangePickerSelectionChangedArgs.value.startDate)
          .toString();
    });
  }

  Future<void> createExcel(String dd, String df) async {
    int i = 0;

    DateTime parseDate = new DateFormat("dd, MMMM yyyy").parse(dd);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    DateTime oo = DateTime.parse(outputDate);
    DateTime parseDate1 = new DateFormat("dd, MMMM yyyy").parse(df);
    var inputDate1 = DateTime.parse(parseDate1.toString());
    var outputFormat1 = DateFormat('yyyy-MM-dd');
    var outputDate1 = outputFormat1.format(inputDate1);

    DateTime oo1 = DateTime.parse(outputDate1);

    final Workbook workbook1 = Workbook();
    final Worksheet sheet = workbook1.worksheets[0];

    sheet.getRangeByName('A1').setText("Temp Value");
    sheet.getRangeByName('B1').setText("Date");
    sheet.getRangeByName('C1').setText("Heure");
    sheet.getRangeByName('D1').setText("Date Debut");
    sheet.getRangeByName('E1').setText("Date Fin ");
    sheet.getRangeByName('E2').setText("${df}");
    sheet.getRangeByName('D2').setText("${dd}");

    QuerySnapshot _qs = await FirebaseFirestore.instance
        .collection('Temperateur1')
        .orderBy('time')
        .where('time', isGreaterThanOrEqualTo: oo.toString())
        .where('time', isLessThanOrEqualTo: oo1.toString())
        .get();

    for (i = 0; i < _qs.docs.length; i++) {
      sheet.getRangeByName('A${i + 2}').setNumber(_qs.docs[i].get('value'));
      sheet
          .getRangeByName('B${i + 2}')
          .setDateTime(DateTime.parse(_qs.docs[i].get('time')));
      sheet.getRangeByName('C${i + 2}').setText(
          '${DateTime.parse(_qs.docs[i].get('time')).hour}:${DateTime.parse(_qs.docs[i].get('time')).minute}');
    }

    final List<int> bytes = workbook1.saveAsStream();
    workbook1.dispose();
    final String path = (await getApplicationDocumentsDirectory()).path;
    final String fileName =
        '$path/Temps${DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString()}.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
