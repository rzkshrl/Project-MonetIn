import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/theme.dart';
import '../../../widgets/custom_nav.dart';
import '../../beranda/views/beranda_view.dart';
import '../../setelan/views/setelan_view.dart';
import '../controllers/home_controller.dart';
import 'package:iconly/iconly.dart';

class HomeView extends StatelessWidget {
  @override
  buildBottomNavigationMenu(context, HomeController) {
    return Obx(() => MediaQuery(
        key: key,
        data: MediaQuery.of(context).removePadding(
          removeTop: true,
          removeBottom: true,
          removeLeft: true,
          removeRight: true,
        ),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(44.0),
                  topRight: const Radius.circular(44.0),
                )),
              ),
              CustomAnimatedBottomBar(
                onItemSelected: HomeController.changeTabIndex,
                //containerHeight: 67,
                selectedIndex: HomeController.tabIndex.value,
                showElevation: true,
                itemCornerRadius: 24,
                curve: Curves.easeIn,
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    icon: Icon(IconlyLight.home),
                    title: Text('Beranda'),
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(IconlyLight.setting),
                    title: Text('Setelan'),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put(HomeController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      backgroundColor: background,
      bottomNavigationBar: buildBottomNavigationMenu(context, homeController),
      body: Obx(() => IndexedStack(
            index: homeController.tabIndex.value,
            children: [
              BerandaView(),
              SetelanView(),
            ],
          )),
    ));
  }
}
