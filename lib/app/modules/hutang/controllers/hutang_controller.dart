import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HutangController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamDataHutang() {
    CollectionReference hutang = firestore.collection("hutang");
    return hutang.snapshots();
  }
}
