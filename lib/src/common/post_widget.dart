import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/common/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/common/image_data.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
          SizedBox(height: 10),
          _image(),
          SizedBox(height: 10),
          _infoCnt(),
          SizedBox(height: 5),
          _infoDescription(),
          SizedBox(height: 10),
          _btnReplyText(),
          SizedBox(height: 10),
          _dateAgo(),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            avatarType: AvatarType.TYPE3,
            nickname: "kykdev",
            size: 40,
            thumbPath: "https://static.wikia.nocookie"
                ".net/pokemon/images/7/7f/%EC%A7%80%EC%9A%B0%EC%9D%98_%EB%A6%AC%EC%9E%90%EB%AA%BD.png/revision/latest/scale-to-width-down/1200?cb=20190225082429&path-prefix=ko",
          ),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 35,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl: "https://blog.kakaocdn.net/dn/Kp5Xd/btruDCpy4Wb/E6WAdMf7hVDxrCqVnLpL51/img.jpg",
    );
  }

  Widget _infoCnt() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(IconsPath.likeOffIcon),
              const SizedBox(
                width: 10,
              ),
              ImageData(IconsPath.replyIcon),
              const SizedBox(
                width: 10,
              ),
              ImageData(IconsPath.directMessage),
            ],
          ),
          ImageData(IconsPath.bookMarkOffIcon)
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "????????? 99???",
            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          ExpandableText(
            "????????? ??????\n????????? ??????\n????????? ??????\n????????? ??????\n????????? ??????\n????????? ??????",
            prefixText: "kykdev",
            onPrefixTap: () {
              print("kykdev ?????? ??????");
            },
            prefixStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            expandText: "?????????",
            collapseText: "??????",
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _btnReplyText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          print("?????? ?????? ??????");
        },
        child: Text(
          "?????? 99??? ?????? ??????",
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        "1??? ???",
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    );
  }
}
