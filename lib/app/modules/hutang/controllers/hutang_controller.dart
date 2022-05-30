import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HutangController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamDataHutang() {
    CollectionReference hutang = firestore.collection("hutang");
    return hutang.orderBy("time", descending: true).snapshots();
  }
  void deleteHutang(String docId) async {
    DocumentReference docRef = firestore.collection("hutang").doc(docId);

    try {
      Get.defaultDialog(
        title: "Hapus Data",
        middleText: "Apakah anda yakin ingin Menghapus Data?",
        textConfirm: "Yes",
        textCancel: "No",
        onConfirm: () async {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Berhasil",
            middleText: "Berhasil Menghapus Data",
            textConfirm: "Okay",
            onConfirm: () {
              Get.back();
            },
          );
        },
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Error",
        middleText: "Tidak Berhasil Menghapus Data",
      );
    }
  }
}
