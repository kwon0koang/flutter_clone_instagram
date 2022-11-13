import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType { DEFAULT, NEW, TYPE3 }

class AvatarWidget extends StatelessWidget {
  AvatarType avatarType;
  String thumbPath;
  bool? hasStory;
  String? nickname;
  double? size;

  AvatarWidget(
      {Key? key,
      required this.avatarType,
      required this.thumbPath,
      this.hasStory,
      this.nickname,
      this.size = 65})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (avatarType) {
      case AvatarType.DEFAULT:
        return _defaultAvatarWidget();
      case AvatarType.NEW:
        return _newAvatarWidget();
      case AvatarType.TYPE3:
        return _type3Widget();
    }
  }

  Widget _defaultAvatarWidget() {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
            width: this.size, height: this.size, imageUrl: thumbPath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _newAvatarWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purple, Colors.orange]),
          shape: BoxShape.circle),
      child: _defaultAvatarWidget(),
    );
  }

  Widget _type3Widget() {
    return Row(
      children: [
        _defaultAvatarWidget(),
        const SizedBox(width: 10),
        Text(
          nickname ?? "",
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
