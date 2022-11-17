import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/common/image_data.dart';
import 'package:flutter_clone_instagram/src/pages/bottom_nav_controller.dart';
import 'package:flutter_clone_instagram/src/pages/home/home.dart';
import 'package:flutter_clone_instagram/src/pages/search/search.dart';
import 'package:get/get.dart';

class MainTab extends GetView<BottomNavController> {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Obx(() => Scaffold(
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                Home(),
                Search(),
                Container(
                    child: Center(
                      child: Text("UPLOAD"),
                    ),
                    color: Colors.green),
                Container(
                    child: Center(
                      child: Text("ACTIVITY"),
                    ),
                    color: Colors.orange),
                Container(
                    child: Center(
                      child: Text("MYPAGE"),
                    ),
                    color: Colors.purple),
              ],
            ),
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
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon),
                  label: 'upload',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'activity',
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
                  label: 'mypage',
                ),
              ],
            ),
          )),
      onWillPop: () async {
        return controller.willPopAction();
      },
    );
  }
}
