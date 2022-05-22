import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_monetin/app/theme/theme.dart';

class BerandaController extends GetxController {
  late TextEditingController namamasukC;
  late TextEditingController jumlahmasukC;
  late TextEditingController hargamasukC;

  late TextEditingController namakeluarC;
  late TextEditingController jumlahkeluarC;
  late TextEditingController hargakeluarC;

  late TextEditingController namaHutangC;
  late TextEditingController totalHutangC;
  late TextEditingController ketHutangC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void tambahPemasukan(
      String namaPem, String jumlahPem, String hargaPem) async {
    CollectionReference pemasukan = firestore.collection("pemasukan");

    try {
      await pemasukan.add({
        "nama": namaPem,
        "jumlah": jumlahPem,
        "harga": hargaPem,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Memasukkan Data",
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
        middleText: "Tidak Berhasil Memasukkan Data",
      );
    }
  }

  void tambahPengeluaran(
      String namaPeng, String jumlahPeng, String hargaPeng) async {
    CollectionReference pengeluaran = firestore.collection("pengeluaran");

    try {
      await pengeluaran.add({
        "nama": namaPeng,
        "jumlah": jumlahPeng,
        "harga": hargaPeng,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Memasukkan Data",
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
        middleText: "Tidak Berhasil Memasukkan Data",
      );
    }
  }

  void tambahHutang(String namaHut, String jumlahHut, String hargaHut) async {
    CollectionReference hutang = firestore.collection("hutang");

    try {
      await hutang.add({
        "nama": namaHut,
        "total": jumlahHut,
        "keterangan": hargaHut,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Memasukkan Data",
        onConfirm: () {
          namaHutangC.clear();
          totalHutangC.clear();
          ketHutangC.clear();
          Get.back();
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
    namaHutangC = TextEditingController();
    totalHutangC = TextEditingController();
    ketHutangC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namamasukC.dispose();
    jumlahmasukC.dispose();
    hargamasukC.dispose();
    namakeluarC.dispose();
    jumlahkeluarC.dispose();
    hargakeluarC.dispose();
    namaHutangC.dispose();
    totalHutangC.dispose();
    ketHutangC.dispose();
    super.onClose();
  }
}
