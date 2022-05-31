import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../theme/theme.dart';
import '../controllers/updatehutang_controller.dart';

class UpdatehutangView extends GetView<UpdatehutangController> {
  final UpdatehutangController controller = Get.put(UpdatehutangController());
  final GlobalKey<FormState> _namaItemHutangKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _jumlahItemHutangKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _hargaItemHutangKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.namahutC.text = data['nama'];
            controller.jumlahhutC.text = data['total'];
            controller.hargahutC.text = data['keterangan'];
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
                          key: _namaItemHutangKey,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                autocorrect: false,
                                textInputAction: TextInputAction.next,
                                onTap: () {},
                                controller: controller.namahutC,
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
                            'Total Hutang',
                            style: heading14pt.copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          key: _jumlahItemHutangKey,
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
                                controller: controller.jumlahhutC,
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
                                  hintText: 'Total Hutang',
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
                            'Keterangan Hutang',
                            style: heading14pt.copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          key: _hargaItemHutangKey,
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                onTap: () {},
                                controller: controller.hargahutC,
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
                                  hintText: 'Isi Keterangan Hutang',
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
                  onPressed: () => controller.editHutang(
                    controller.namahutC.text,
                    controller.jumlahhutC.text,
                    controller.hargahutC.text,
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
