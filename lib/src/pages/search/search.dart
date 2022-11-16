import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/pages/search/search_focus/search_focus.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset : false,
        body: Column(
          children: [
            _appBar(),
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(SearchFocus());
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xffefefef),
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text(
                    "검색",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff838383),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                20,
                (index) => Container(
                  height: Get.width * 0.33,
                  decoration: BoxDecoration(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    border: Border.all(color: Colors.white),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://blog.kakaocdn.net/dn/Kp5Xd/btruDCpy4Wb/E6WAdMf7hVDxrCqVnLpL51/img.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
