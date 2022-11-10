import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/common/image_data.dart';
import 'package:flutter_clone_instagram/src/pages/bottom_nav_controller.dart';
import 'package:get/get.dart';

class Home extends GetView<BottomNavController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => Scaffold(
            appBar: AppBar(),
            body: IndexedStack(index: controller.pageIndex.value, children: [
              Container(child: Center(child: Text("HOME")), color: Colors.blue),
              Container(child: Center(child: Text("SEARCH")), color: Colors.yellow),
              Container(child: Center(child: Text("UPLOAD")), color: Colors.green),
              Container(child: Center(child: Text("ACTIVITY")), color: Colors.orange),
              Container(child: Center(child: Text("MYPAGE")), color: Colors.purple),
            ]),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              elevation: 0,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  label: 'home',
                ),
              ],
            ),
          )),
      onWillPop: () async {
        return false;
      },
    );
  }
}
