import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PemasukanController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamDataPemasukan() {
    CollectionReference pemasukan = firestore.collection("pemasukan");
    return pemasukan.snapshots();
  }
}
