import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_html/flutter_html.dart';

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection(
              'learn',
            )
            .doc(
              'modules',
            )
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final modules = snapshot.data;

          return modules!.get('module1').length == 0
              ? Center(
                  child: Card(
                    margin: EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Server Error: No Modules Found",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              : Center(
                  child: SingleChildScrollView(
                    child: Card(
                      margin: EdgeInsets.all(24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Html(
                          data: modules[0].get('content'),
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
