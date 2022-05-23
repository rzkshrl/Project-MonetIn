import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PengeluaranController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamDataPengeluaran() {
    CollectionReference pengeluaran = firestore.collection("pengeluaran");
    return pengeluaran.snapshots();
  }
}
