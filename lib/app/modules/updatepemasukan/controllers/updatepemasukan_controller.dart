import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdatepemasukanController extends GetxController {
  late TextEditingController namamasukC;
  late TextEditingController jumlahmasukC;
  late TextEditingController hargamasukC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("pemasukan").doc(docID);
    return docRef.get();
  }

  void editPemasukan(
      String namaPem, String jumlahPem, String hargaPem, String docID) async {
    DocumentReference docPemasukan =
        firestore.collection("pemasukan").doc(docID);

    try {
      await docPemasukan.update({
        "nama": namaPem,
        "jumlah": jumlahPem,
        "harga": hargaPem,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah Data",
        onConfirm: () {
          namamasukC.clear();
          jumlahmasukC.clear();
          hargamasukC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "Okay",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Error",
        middleText: "Tidak Berhasil Mengubah Data",
      );
    }
  }

  @override
  void onInit() {
    namamasukC = TextEditingController();
    jumlahmasukC = TextEditingController();
    hargamasukC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namamasukC.dispose();
    jumlahmasukC.dispose();
    hargamasukC.dispose();
    super.onClose();
  }
}
