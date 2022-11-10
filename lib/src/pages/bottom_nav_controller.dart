import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/common/message_popup.dart';
import 'package:flutter_clone_instagram/src/pages/upload/upload.dart';
import 'package:flutter_clone_instagram/src/pages/upload/upload_controller.dart';
import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> searchPageNaviationKey = GlobalKey<NavigatorState>();

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => Upload(), binding: BindingsBuilder(() {
          Get.put(UploadController());
        }));
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        changePage(value);
        break;
    }
  }

  void changePage(int value) {
    pageIndex(value);
  }

  Future<bool> willPopAction() async {
    showDialog(
      context: Get.context!,
      builder: (context) => MessagePopup(
        title: "시스템",
        message: "종료하시겠습니까 ?",
        okCallback: () {
          exit(0);
        },
        cancelCallback: Get.back
      ),
    );
    return false;
  }
}
