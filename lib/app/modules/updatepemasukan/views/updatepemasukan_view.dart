import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../controllers/updatepemasukan_controller.dart';

class UpdatepemasukanView extends GetView<UpdatepemasukanController> {
  final UpdatepemasukanController controller =
      Get.put(UpdatepemasukanController());
  final GlobalKey<FormState> _namaItemPemasukanKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _jumlahItemPemasukanKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _hargaItemPemasukanKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.namamasukC.text = data['nama'];
            controller.jumlahmasukC.text = data['jumlah'];
            controller.hargamasukC.text = data['harga'];
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
                          key: _namaItemPemasukanKey,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                onTap: () {},
                                controller: controller.namamasukC,
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
                          key: _jumlahItemPemasukanKey,
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
                                controller: controller.jumlahmasukC,
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
                          key: _hargaItemPemasukanKey,
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
                                controller: controller.hargamasukC,
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
                  onPressed: () => controller.editPemasukan(
                    controller.namamasukC.text,
                    controller.jumlahmasukC.text,
                    controller.hargamasukC.text,
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
