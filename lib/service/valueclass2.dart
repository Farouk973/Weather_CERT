import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class valueclass2 extends StatelessWidget {
  final String docuid;

  valueclass2({required this.docuid});
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

          return (RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: "${data['value']}°c",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 68,
                    color: Colors.black),
              )
            ],
          )));
        }
        return Text('loading');
      }),
    );
  }
}
