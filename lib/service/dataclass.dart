import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class dataclass extends StatelessWidget {
  final String docuid;

  dataclass({required this.docuid});
  @override
  Widget build(BuildContext context) {
    CollectionReference idiis =
        FirebaseFirestore.instance.collection('Temperateur1');

    return FutureBuilder<DocumentSnapshot>(
      future: idiis.doc(docuid).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return (Text('${data['value']} at ${data['time'].split('T')[0]}'));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
