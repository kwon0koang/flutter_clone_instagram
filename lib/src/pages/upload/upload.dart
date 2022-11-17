import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/common/image_data.dart';
import 'package:get/get.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ImageData(IconsPath.closeImage),
          ),
        ),
        title: Text(
          "New Post",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // todo kyk
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ImageData(IconsPath.nextImage),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imagePreview(),
            _header(),
            _imageSelectList(),
          ],
        ),
      ),
    );
  }

  Widget _imagePreview() {
    return Container(
      width: Get.width,
      height: Get.width,
      color: Colors.grey,
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "갤러리",
                style: TextStyle(fontSize: 15),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Color(0xff808080),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    ImageData(IconsPath.imageSelectIcon),
                    SizedBox(width: 5),
                    Text(
                      "여러 항목 선택",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Container(
                child: ImageData(IconsPath.cameraIcon),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff808080),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageSelectList() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),    // 외부에 SingleChildScrollView 있기 때문에 GridView 스크롤 제거
      shrinkWrap: true,                           // 외부에 SingleChildScrollView 있기 때문에 GridView 스크롤 제거
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 50,
      itemBuilder: (context, index) {
        return Container(
          color: Colors
              .primaries[Random().nextInt(Colors.primaries.length)],
        );
      },
    );
  }
}
