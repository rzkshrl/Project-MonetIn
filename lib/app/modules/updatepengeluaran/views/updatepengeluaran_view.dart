import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../controllers/updatepengeluaran_controller.dart';

class UpdatepengeluaranView extends GetView<UpdatepengeluaranController> {
  final UpdatepengeluaranController controller =
      Get.put(UpdatepengeluaranController());
  final GlobalKey<FormState> _namaItemPengeluaranKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _jumlahItemPengeluaranKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _hargaItemPengeluaranKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.namakeluarC.text = data['nama'];
            controller.jumlahkeluarC.text = data['jumlah'];
            controller.hargakeluarC.text = data['harga'];
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              backgroundColor: primaryBrown,
              content: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Nama Item',
                            style: heading14pt.copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          key: _namaItemPengeluaranKey,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                onTap: () {},
                                controller: controller.namakeluarC,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Form tidak boleh kosong";
                                },
                                style:
                                    regular16pt.copyWith(color: Colors.white),
                                decoration: InputDecoration(
                                  errorStyle:
                                      regular10pt.copyWith(color: error),
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: error)),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: error)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  hintText: 'Isi Nama Item Transaksi Masuk',
                                  hintStyle:
                                      regular16pt.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'QTY',
                            style: heading14pt.copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          key: _jumlahItemPengeluaranKey,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                textInputAction: TextInputAction.next,
                                onTap: () {},
                                controller: controller.jumlahkeluarC,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Form tidak boleh kosong";
                                },
                                style:
                                    regular16pt.copyWith(color: Colors.white),
                                decoration: InputDecoration(
                                  errorStyle:
                                      regular10pt.copyWith(color: error),
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: error)),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: error)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  hintText: 'Jumlah Item',
                                  hintStyle:
                                      regular16pt.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Harga',
                            style: heading14pt.copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          key: _hargaItemPengeluaranKey,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                textInputAction: TextInputAction.done,
                                onTap: () {},
                                controller: controller.hargakeluarC,
                                validator: (value) {
                                  return value!.isNotEmpty
                                      ? null
                                      : "Form tidak boleh kosong";
                                },
                                style:
                                    regular16pt.copyWith(color: Colors.white),
                                decoration: InputDecoration(
                                  errorStyle:
                                      regular10pt.copyWith(color: error),
                                  focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: error)),
                                  errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: error)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: colorLight),
                                  ),
                                  hintText: 'Isi Harga Item',
                                  hintStyle:
                                      regular16pt.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 10),
                      primary: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('BATAL'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(fontSize: 10),
                      primary: Colors.white),
                  onPressed: () => controller.editPengeluaran(
                    controller.namakeluarC.text,
                    controller.jumlahkeluarC.text,
                    controller.hargakeluarC.text,
                    Get.arguments,
                  ),
                  child: Text('SIMPAN'),
                )
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
