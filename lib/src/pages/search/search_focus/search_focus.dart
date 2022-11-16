import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/common/image_data.dart';

enum SearchTabType {
  FAVORITE("인기"),
  ACCOUNT("계정"),
  AUDIO("오디오"),
  TAG("태그"),
  LOCATION("장소");

  final String label;
  const SearchTabType(this.label);
}

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  final int TAB_CNT = 5;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TAB_CNT, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(18),
          child: ImageData(
            IconsPath.backBtnIcon,
          ),
        ),
        titleSpacing: 0,
        title: Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color(0xffefefef),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "검색",
              contentPadding: EdgeInsets.only(left: 10),
              border: InputBorder.none,
            ),
          ),
        ),
        bottom: _tabMenu(),
      ),
      body: _body(),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      //Size.fromHeight(AppBar().preferredSize.height),
      child: Container(
        width: double.infinity,
        height: 50,
        child: TabBar(
          controller: _tabController,
          tabs: [
            _tabMenuItem(SearchTabType.FAVORITE),
            _tabMenuItem(SearchTabType.ACCOUNT),
            _tabMenuItem(SearchTabType.AUDIO),
            _tabMenuItem(SearchTabType.TAG),
            _tabMenuItem(SearchTabType.LOCATION),
          ],
          indicatorColor: Colors.black,
        ),
      ),
    );
  }

  Widget _tabMenuItem(SearchTabType tabType) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        tabType.label,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _tabView() {
    return Container();
  }

  Widget _body() {
    return TabBarView(
      controller: _tabController,
      children: [
        Center(
          child: Text(SearchTabType.FAVORITE.label),
        ),
        Center(
          child: Text(SearchTabType.ACCOUNT.label),
        ),
        Center(
          child: Text(SearchTabType.AUDIO.label),
        ),
        Center(
          child: Text(SearchTabType.TAG.label),
        ),
        Center(
          child: Text(SearchTabType.LOCATION.label),
        ),
      ],
    );
  }
}
