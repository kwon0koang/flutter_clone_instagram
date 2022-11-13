import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/common/avatar_widget.dart';
import 'package:flutter_clone_instagram/src/common/image_data.dart';
import 'package:flutter_clone_instagram/src/common/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(IconsPath.logo, width: 270),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        SizedBox(width: 20),
        _myStory(),
        SizedBox(width: 5),
        ...List.generate(
          100,
          (index) => AvatarWidget(
            avatarType: AvatarType.NEW,
            thumbPath: "https://w.namu"
                ""
                ""
                ""
                ".la/s/f1dbb5118738ea9ae30b8dffe5e09aeeebe528b1023f67da317dd68c3e12ab14979925126dd0fd2948e18cd82d5c484e3438a6274f4b48c17a9fcf20817a7b08c8679bbf49b3589ddbd599c1592a1513c9128ab008eefbe8665700300c47731e7b9c7cadd7d15a2d027d948f837599ad",
          ),
        ),
      ]),
    );
  }

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          avatarType: AvatarType.DEFAULT,
          thumbPath: "https://static.wikia.nocookie"
              ".net/pokemon/images/7/7f/%EC%A7%80%EC%9A%B0%EC%9D%98_%EB%A6%AC%EC%9E%90%EB%AA%BD.png/revision/latest/scale-to-width-down/1200?cb=20190225082429&path-prefix=ko",
        ),
        Positioned(
          right: 2,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(
              child: Text(
                "+",
                style: TextStyle(color: Colors.white, fontSize: 20, height: 1.1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(
        100,
        (index) => PostWidget(),
      ),
    );
  }
}
