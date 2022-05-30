import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UpdatehutangController extends GetxController {
  late TextEditingController namahutC;
  late TextEditingController jumlahhutC;
  late TextEditingController hargahutC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("hutang").doc(docID);
    return docRef.get();
  }

  void editHutang(
      String namaHut, String jumlahHut, String hargaHut, String docID) async {
    DocumentReference docHutang =
        firestore.collection("hutang").doc(docID);

    try {
      await docHutang.update({
        "nama": namaHut,
        "total": jumlahHut,
        "keterangan": hargaHut,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah Data",
        onConfirm: () {
          namahutC.clear();
          jumlahhutC.clear();
          hargahutC.clear();
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
    namahutC = TextEditingController();
    jumlahhutC = TextEditingController();
    hargahutC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namahutC.dispose();
    jumlahhutC.dispose();
    hargahutC.dispose();
    super.onClose();
  }
}
