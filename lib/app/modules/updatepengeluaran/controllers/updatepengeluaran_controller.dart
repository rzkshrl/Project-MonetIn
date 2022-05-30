import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdatepengeluaranController extends GetxController {
  late TextEditingController namakeluarC;
  late TextEditingController jumlahkeluarC;
  late TextEditingController hargakeluarC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("pengeluaran").doc(docID);
    return docRef.get();
  }

  void editPengeluaran(
      String namaPeng, String jumlahPeng, String hargaPeng, String docID) async {
    DocumentReference docPengeluaran =
        firestore.collection("pengeluaran").doc(docID);

    try {
      await docPengeluaran.update({
        "nama": namaPeng,
        "jumlah": jumlahPeng,
        "harga": hargaPeng,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah Data",
        onConfirm: () {
          namakeluarC.clear();
          jumlahkeluarC.clear();
          hargakeluarC.clear();
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
    namakeluarC = TextEditingController();
    jumlahkeluarC = TextEditingController();
    hargakeluarC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namakeluarC.dispose();
    jumlahkeluarC.dispose();
    hargakeluarC.dispose();
    super.onClose();
  }
}
