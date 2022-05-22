import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_monetin/app/theme/theme.dart';

import '../controllers/pemasukan_controller.dart';

class PemasukanView extends GetView<PemasukanController> {
  final PemasukanController controller = Get.put(PemasukanController());
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(children: [
        Positioned(
          top: 10,
          left: 20,
          child: Text(
            'Detail',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: primaryBrown.withOpacity(0.20)),
          ),
        ),
        Positioned(
          top: 56,
          left: 20,
          child: Text(
            'Transaksi',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: primaryBrown.withOpacity(0.20)),
          ),
        ),
        Positioned(
            child: Container(
          child: StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.streamDataPemasukan(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var listAllDocs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                          "Nama Item ${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
                      subtitle: Text(
                          "QTY ${(listAllDocs[index].data() as Map<String, dynamic>)["jumlah"]}"),
                    ),
                  );
                  // return SliverList(
                  //   delegate: SliverChildBuilderDelegate(
                  //       (BuildContext context, int index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container,
                  //     );
                  //   }, childCount: 1),
                  // );
                }
                return Center(child: CircularProgressIndicator());
              }),
        ))
      ]),
    );
  }
}
