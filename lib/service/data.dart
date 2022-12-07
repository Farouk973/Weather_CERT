import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:influxdb_client/api.dart';
import 'package:smart_irrigation/service/dataclass.dart';

class data {
  var client = InfluxDBClient(
      url: 'http://52.51.92.31:8086',
      token:
          "hChb_sDWSnXG7zoLU6l-GbyMUdWmIkSsZYrGjfb9UK-INuKOv6FsTI0bcE7yEMixMJeuBugLku9uGT_kQFzxiA==",
      org: 'SWALP',
      bucket: 'weather_station_bucket',
      debug: true);

  List<String> docIDs = [];
  List<double> ff = [];
  getDocId() async {
    await FirebaseFirestore.instance
        .collection('Temperateur1')
        .orderBy('time', descending: true)
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              if (docIDs.contains(element.reference.id)) {
                docIDs.remove(element.reference.id);
                docIDs.add(element.reference.id);
              } else {
                docIDs.add(element.reference.id);
              }
            }));
  }

  void req1() async {
    var queryService = client.getQueryService();
    var recordStream = await queryService.query('''
      from(bucket: "weather_station_bucket")
      |> range(start: 0)
      |> filter(fn: (r) => r["_measurement"] == "device_frmpayload_data_temperatureSensor_4")
      |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
|> yield(name: "mean")
      //|> filter(fn: (r) => r["_value"] == 34.1)
      //|> last()
      ''');

    final snapshot =
        await FirebaseFirestore.instance.collection('Temperateur1').get();

    int count = 0;
    if (snapshot.size != 0) {
      print("temperateur exist");
      await recordStream.forEach((record) {
        count++;
        final doctemp =
            FirebaseFirestore.instance.collection('Temperateur1').doc('$count');
        final json = {'time': record['_time'], 'value': record['_value']};
        doctemp.set(json);
      });
    }
    if (snapshot.size == 0) {
      print("temperateur doesn't exist");
      await recordStream.forEach((record) {
        count++;

        final doctemp =
            FirebaseFirestore.instance.collection('Temperateur1').doc('$count');
        final json = {'time': record['_time'], 'value': record['_value']};
        doctemp.set(json);
      });
    }
    //////precipitations
    /*var recordStream1 = await queryService.query('''
      from(bucket: "weather_station_bucket")
      |> range(start: 0)
      |> filter(fn: (r) => r["_measurement"] == "device_frmpayload_data_analogInput_1"
      )
      |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
|> yield(name: "mean")''');
    final snapshot1 =
        await FirebaseFirestore.instance.collection('precipitations1').get();
    int count1 = 0;
    if (snapshot1.size != 0) {
      print("precipitations exist");
      await recordStream1.forEach((record) {
        count1++;
        final doctemp = FirebaseFirestore.instance
            .collection('precipitations1')
            .doc('$count1');
        final json = {'time': record['_time'], 'value': record['_value']};
        doctemp.set(json);
      });
    }
    if (snapshot1.size == 0) {
      print("precipitations doesn't exist");
      await recordStream1.forEach((record) {
        count1++;
        final doctemp = FirebaseFirestore.instance
            .collection('precipitations1')
            .doc('$count1');
        final json = {'time': record['_time'], 'value': record['_value']};
        doctemp.set(json);
      });
    }*/
    //////pression
    var recordStream2 = await queryService.query('''
      from(bucket: "weather_station_bucket")
      |> range(start: 0)
      |> filter(fn: (r) => r["_measurement"] == "device_frmpayload_data_barometer_5")
      |> aggregateWindow(every: 1m, fn: mean, createEmpty: false)
|> yield(name: "mean")''');
    final snapshot2 =
        await FirebaseFirestore.instance.collection('pression1').get();
    int count2 = 0;
    if (snapshot2.size != 0) {
      print("pression exist");
      await recordStream2.forEach((record) {
        count2++;
        final doctemp =
            FirebaseFirestore.instance.collection('pression1').doc('$count2');
        final json = {'time': record['_time'], 'value': record['_value']};
        doctemp.set(json);
      });
    }
    if (snapshot2.size == 0) {
      print("pression doesn't exist");
      await recordStream2.forEach((record) {
        count2++;
        final doctemp =
            FirebaseFirestore.instance.collection('pression1').doc('$count2');
        final json = {'time': record['_time'], 'value': record['_value']};
        doctemp.set(json);
      });
    }
    client.close();
  }
}
