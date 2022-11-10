import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3 }

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
      case AvatarType.TYPE1:
        return _type1Widget();
      case AvatarType.TYPE2:
        return _type2Widget();
      case AvatarType.TYPE3:
        return Container();
    }
  }

  Widget _type1Widget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purple, Colors.orange]),
          shape: BoxShape.circle),
      child: _type2Widget(),
    );
  }

  Widget _type2Widget() {
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
}
