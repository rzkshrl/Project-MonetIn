import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BerandaController extends GetxController {
  late TextEditingController namamasukC;
  late TextEditingController jumlahmasukC;
  late TextEditingController hargamasukC;

  late TextEditingController namakeluarC;
  late TextEditingController jumlahkeluarC;
  late TextEditingController hargakeluarC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void tambah(String nama, String jumlah, String harga) async {
    CollectionReference pemasukan = firestore.collection("pemasukan");
    CollectionReference pengeluaran = firestore.collection("pengeluaran");
    
    try {
      await pemasukan.add({
      "nama": nama,
      "jumlah": jumlah,
      "harga": harga,
    });
    await pengeluaran.add({
      "nama": nama,
      "jumlah": jumlah,
      "harga": harga,
    });
    Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil Memasukkan Data",
      onConfirm: () {
        namamasukC.clear();
        jumlahmasukC.clear();
        hargamasukC.clear();
        namakeluarC.clear();
        jumlahkeluarC.clear();
        hargakeluarC.clear();
        Get.back();
      },
      textConfirm: "Okay",
    );
    } catch (e) {
      print(e);
      Get.defaultDialog(
      title: "Error",
      middleText: "Tidak Berhasil Memasukkan Data",
      );
    }
  }

  @override
  void onInit() {
    namamasukC = TextEditingController();
    jumlahmasukC = TextEditingController();
    hargamasukC = TextEditingController();
    namakeluarC = TextEditingController();
    jumlahkeluarC = TextEditingController();
    hargakeluarC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namamasukC.dispose();
    jumlahmasukC.dispose();
    hargamasukC.dispose();
    namamasukC.dispose();
    jumlahmasukC.dispose();
    hargamasukC.dispose();
    super.onClose();
  }

  
}
