import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:project_monetin/app/modules/hutang/views/hutang_view.dart';
import 'package:project_monetin/app/modules/pemasukan/views/pemasukan_view.dart';
import 'package:project_monetin/app/modules/pengeluaran/views/pengeluaran_view.dart';
import '../../../theme/theme.dart';
import '../../../widgets/custom_icons_icons.dart';
import '../controllers/beranda_controller.dart';

class BerandaView extends GetView<BerandaController> {
  final String qtymasuk;
  final String qtykeluar;
  final String totalmasuk;
  final String totalkeluar;

  final BerandaController controller = Get.put(BerandaController());

  Future<void> showPemasukanDialog(BuildContext context) async {
    final GlobalKey<FormState> _namaItemPemasukanKey = GlobalKey<FormState>();
    final GlobalKey<FormState> _jumlahItemPemasukanKey = GlobalKey<FormState>();
    final GlobalKey<FormState> _hargaItemPemasukanKey = GlobalKey<FormState>();
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          return StatefulBuilder(builder: (context, setState) {
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
                                keyboardType: TextInputType.number,
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
                                keyboardType: TextInputType.number,
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
                  onPressed: () => controller.tambahPemasukan(
                    controller.namamasukC.text,
                    controller.jumlahmasukC.text,
                    controller.hargamasukC.text,
                  ),
                  child: Text('SIMPAN'),
                )
              ],
            );
          });
        });
  }

  Future<void> showPengeluaranDialog(BuildContext context2) async {
    final GlobalKey<FormState> _namaItemPengeluaranKey = GlobalKey<FormState>();
    final GlobalKey<FormState> _jumlahItemPengeluaranKey =
        GlobalKey<FormState>();
    final GlobalKey<FormState> _hargaItemPengeluaranKey =
        GlobalKey<FormState>();
    return await showDialog(
        context: context2,
        builder: (context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          return StatefulBuilder(builder: (context2, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              backgroundColor: primaryPurple,
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
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
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
                                  hintText: 'Isi Nama Item Transaksi Keluar',
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
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
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
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
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
                  onPressed: () => controller.tambahPengeluaran(
                    controller.namakeluarC.text,
                    controller.jumlahkeluarC.text,
                    controller.hargakeluarC.text,
                  ),
                  child: Text('SIMPAN'),
                )
              ],
            );
          });
        });
  }

  Future<void> showHutangDialog(BuildContext context3) async {
    final GlobalKey<FormState> _namaItemHutangKey = GlobalKey<FormState>();
    final GlobalKey<FormState> _jumlahItemHutangKey = GlobalKey<FormState>();
    final GlobalKey<FormState> _hargaItemHutangKey = GlobalKey<FormState>();
    return await showDialog(
        context: context3,
        builder: (context) {
          final TextEditingController _textEditingController =
              TextEditingController();
          return StatefulBuilder(builder: (context2, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              backgroundColor: primaryGreen,
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
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                onTap: () {},
                                controller: controller.namaHutangC,
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
                                  hintText: 'Isi Nama Item Hutang',
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
                            'Total',
                            style: heading14pt.copyWith(color: Colors.white),
                          ),
                        ),
                        Form(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                onTap: () {},
                                controller: controller.totalHutangC,
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
                                  hintText: 'Isi Total Hutang',
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
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: TextFormField(
                                onTap: () {},
                                controller: controller.ketHutangC,
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
                  onPressed: () => controller.tambahHutang(
                    controller.namaHutangC.text,
                    controller.totalHutangC.text,
                    controller.ketHutangC.text,
                  ),
                  child: Text('SIMPAN'),
                )
              ],
            );
          });
        });
  }

  BerandaView({
    this.qtymasuk = '15',
    this.qtykeluar = '7',
    this.totalmasuk = '1.000.000',
    this.totalkeluar = '645.000',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
            floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              backgroundColor: primaryBrownRed,
              spacing: 10,
              //floatingactionbutton
              children: [
                SpeedDialChild(
                    child: Icon(
                      CustomIcons.attach_money,
                      color: Colors.white,
                    ),
                    backgroundColor: primaryBrown,
                    label: 'Pemasukan',
                    onTap: () {
                      showPemasukanDialog(context);
                    }),
                SpeedDialChild(
                    child: Icon(
                      CustomIcons.money_off,
                      color: Colors.white,
                    ),
                    backgroundColor: primaryPurple,
                    label: 'Pengeluaran',
                    onTap: () {
                      showPengeluaranDialog(context);
                    }),
                SpeedDialChild(
                    child: Icon(
                      CustomIcons.money,
                      color: Colors.white,
                    ),
                    backgroundColor: primaryGreen,
                    label: 'Hutang',
                    onTap: () {
                      showHutangDialog(context);
                    })
              ],
            ),
            backgroundColor: background,
            body: StreamBuilder<QuerySnapshot<Object?>>(
                stream: controller.streamDataPemasukan(),
                builder: (
                  context,
                  snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var listAllDocs = snapshot.data!.docs;
                    // sum += double.parse(listAllDocs['jumlah']);
                    return Stack(
                      children: [
                        //title
                        Positioned(
                          top: -10,
                          left: 20,
                          child: Text(
                            'Beranda',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 63,
                                fontWeight: FontWeight.bold,
                                color: primaryBrown.withOpacity(0.20)),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(children: [
                            SizedBox(
                              height: 70,
                            ),
                            //Pemasukan
                            Container(
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: new Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 40,
                                    right: 40,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 170,
                                          width: 344,
                                          decoration: BoxDecoration(
                                            color: primaryBrown,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        Positioned(
                                            top: 13,
                                            left: 270,
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.transparent,
                                                child: IconButton(
                                                  onPressed: () => Get.to(
                                                      () => PemasukanView()),
                                                  icon: Icon(
                                                    Icons.more_vert_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                          top: 25,
                                          left: 25,
                                          child: Stack(children: [
                                            Text(
                                              'Transaksi Masuk',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '\n\nBulan ini :\n\n       Stok\n       Total',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ]),
                                        ),
                                        Positioned(
                                          top: 95,
                                          left: 210,
                                          right: 0,
                                          child: Stack(children: [
                                            Text(
                                              'QTY:',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Positioned(
                                                left: 40,
                                                right: 0,
                                                child: Text('21',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left)
                                                // child: StreamBuilder(
                                                //     stream: FirebaseFirestore
                                                //         .instance
                                                //         .collection('pemasukan')
                                                //         .snapshots(),
                                                //     builder: (context, snapshot) {
                                                //       if (!snapshot.hasData)
                                                //         return Text('Loading Data..');
                                                //       return Text(snapshot.data!.docs.map((DocumentSnapshot document)));
                                                //     }),
                                                ),
                                            Text('\nRp.',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left),
                                            Positioned(
                                                left: 30,
                                                right: 0,
                                                top: 19,
                                                child: Text('1.025.000',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left)
                                                //   child: StreamBuilder(
                                                //       stream: FirebaseFirestore
                                                //           .instance
                                                //           .collection('pemasukan')
                                                //           .snapshots(),
                                                //       builder: (context, snapshot) {
                                                //         if (!snapshot.hasData)
                                                //           return Text('Loading Data..');
                                                //         return Text(snapshot.data!.docs.map((DocumentSnapshot document)));
                                                //       }),
                                                ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //Pengeluaran
                            Container(
                              height: 170,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: new Stack(
                                fit: StackFit.passthrough,
                                clipBehavior: Clip.hardEdge,
                                children: [
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 40,
                                    right: 40,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 170,
                                          width: 344,
                                          decoration: BoxDecoration(
                                            color: primaryPurple,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        Positioned(
                                            top: 13,
                                            left: 270,
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.transparent,
                                                child: IconButton(
                                                  onPressed: () => Get.to(
                                                      () => PengeluaranView()),
                                                  icon: Icon(
                                                    Icons.more_vert_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                          top: 25,
                                          left: 25,
                                          child: Stack(children: [
                                            Text(
                                              'Transaksi Keluar',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '\n\nBulan ini :\n\n       Stok\n       Total',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ]),
                                        ),
                                        Positioned(
                                          top: 95,
                                          left: 210,
                                          right: 0,
                                          child: Stack(children: [
                                            Text(
                                              'QTY:',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Positioned(
                                                left: 40,
                                                right: 0,
                                                child: Text('70',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left)
                                                //   child: StreamBuilder(
                                                //       stream: FirebaseFirestore
                                                //           .instance
                                                //           .collection('pemasukan')
                                                //           .snapshots(),
                                                //       builder: (context, snapshot) {
                                                //         if (!snapshot.hasData)
                                                //           return Text('Loading Data..');
                                                //         return Text(snapshot.data!.docs.map((DocumentSnapshot document)));
                                                //       }),
                                                ),
                                            Text('\nRp.',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left),
                                            Positioned(
                                                left: 30,
                                                right: 0,
                                                top: 19,
                                                child: Text('1.950.000',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left)
                                                //   child: StreamBuilder(
                                                //       stream: FirebaseFirestore
                                                //           .instance
                                                //           .collection('pemasukan')
                                                //           .snapshots(),
                                                //       builder: (context, snapshot) {
                                                //         if (!snapshot.hasData)
                                                //           return Text('Loading Data..');
                                                //         return Text(snapshot.data!.docs.map((DocumentSnapshot document)));
                                                //       }),
                                                ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            //Hutang
                            Container(
                              height: 105,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.transparent,
                              child: new Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 40,
                                    right: 40,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 116,
                                          width: 344,
                                          decoration: BoxDecoration(
                                            color: primaryGreen,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        Positioned(
                                            top: 13,
                                            left: 270,
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.transparent,
                                                child: IconButton(
                                                  onPressed: () => Get.to(
                                                      () => HutangView()),
                                                  icon: Icon(
                                                    Icons.more_vert_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                          top: 25,
                                          left: 25,
                                          child: Stack(children: [
                                            Text(
                                              'Hutang',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '\n\nTotal',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ]),
                                        ),
                                        Positioned(
                                          top: 45,
                                          left: 210,
                                          right: 0,
                                          child: Stack(children: [
                                            Text('\nRp.',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.left),
                                            Positioned(
                                                left: 20,
                                                right: 0,
                                                top: 19,
                                                child: Text('450.000',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.left)
                                                //   child: StreamBuilder(
                                                //       stream: FirebaseFirestore
                                                //           .instance
                                                //           .collection('pemasukan')
                                                //           .snapshots(),
                                                //       builder: (context, snapshot) {
                                                //         if (!snapshot.hasData)
                                                //           return Text('Loading Data..');
                                                //         return Text(snapshot.data!.docs.map((DocumentSnapshot document)));
                                                //       }),
                                                ),
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        )
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                })));
  }
}
