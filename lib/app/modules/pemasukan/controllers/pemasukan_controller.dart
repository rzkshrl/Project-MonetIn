import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PemasukanController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamDataPemasukan() {
    CollectionReference pemasukan = firestore.collection("pemasukan");
    return pemasukan.orderBy("time", descending: true).snapshots();
  }

  void deletePemasukan(String docId) async {
    DocumentReference docRef = firestore.collection("pemasukan").doc(docId);

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
