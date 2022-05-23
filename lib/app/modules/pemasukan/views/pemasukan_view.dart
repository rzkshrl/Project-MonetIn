import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_monetin/app/theme/theme.dart';

import '../controllers/pemasukan_controller.dart';

class PemasukanView extends GetView<PemasukanController> {
  final PemasukanController controller = Get.put(PemasukanController());
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: StreamBuilder<QuerySnapshot<Object?>>(
          stream: controller.streamDataPemasukan(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var listAllDocs = snapshot.data!.docs;
              // return ListView.builder(
              //   itemCount: listAllDocs.length,
              //   itemBuilder: (context, index) => ListTile(
              //     title: Text(
              //         "Nama Item ${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
              //     subtitle: Text(
              //         "QTY ${(listAllDocs[index].data() as Map<String, dynamic>)["jumlah"]}"),
              //   ),
              // );
              return CustomScrollView(
                slivers: [
                  CustomAppBar(
                    title: "Detail Transaksi",
                    action: Row(
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.exit_to_app_rounded,
                                color: primaryBrown.withOpacity(0.50),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 160,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                            child: new Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  left: 35,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 160,
                                        width: 344,
                                        decoration: BoxDecoration(
                                          color: generateRandomColor(),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      Positioned(
                                          top: 13,
                                          left: 240,
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.transparent,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )),
                                      Positioned(
                                          top: 13,
                                          left: 280,
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.transparent,
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.delete,
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
                                            '\n\nItem \n       ${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ]),
                                      ),
                                      Positioned(
                                          top: 120,
                                          left: 25,
                                          child: Text(
                                            "Total",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                      Positioned(
                                        top: 89,
                                        left: 220,
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
                                              left: 20,
                                              right: 0,
                                              child: Text(
                                                "${(listAllDocs[index].data() as Map<String, dynamic>)["jumlah"]}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                textAlign: TextAlign.center,
                                              )),
                                        ]),
                                      ),
                                      Positioned(
                                          top: 99,
                                          left: 200,
                                          right: 0,
                                          child: Stack(
                                            children: [
                                              Text('\nRp.',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.left),
                                              Positioned(
                                                  top: 20,
                                                  left: 30,
                                                  right: 0,
                                                  child: Text(
                                                    "${(listAllDocs[index].data() as Map<String, dynamic>)["harga"]}",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  )),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }, childCount: snapshot.data!.size),
                  )
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Color generateRandomColor() {
  // Define all colors you want here
  final predefinedColors = [
    primaryBrown,
    primaryPurple,
    primaryGreen,
    primaryBrownRed,
  ];
  Random random = Random();
  return predefinedColors[random.nextInt(predefinedColors.length)];
}

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Widget? action;
  final bool? showLeading;
  var top = 0.0;

  CustomAppBar(
      {Key? key, @required this.title, this.action, this.showLeading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: showLeading!,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      action!,
                      Text(title!,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color: primaryBrown.withOpacity(0.20))),
                    ],
                  ))
            ],
          ),
        );
      }),
    );
  }
}
