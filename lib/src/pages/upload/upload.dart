import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/common/image_data.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  var _albums = <AssetPathEntity>[];
  AssetPathEntity? _selectedAlbum;

  var _photos = <AssetEntity>[];
  AssetEntity? _selectedPhoto;

  @override
  void initState() {
    super.initState();
    _initAlbums();
  }

  /**
   * 앨범 초기화
   */
  void _initAlbums() async {
    var result = await PhotoManager.requestPermissionExtend();

    // 권한 확인
    if (result.isAuth) {
      // 앨범 로드
      _albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: FilterOption(
            sizeConstraint: SizeConstraint(minHeight: 100, minWidth: 100),
          ),
          orders: [
            OrderOption(type: OrderOptionType.createDate, asc: false),
          ],
        ),
      );

      // 앨범 사진 로드
      _loadPhotos(_albums.first);
    } else {
      // todo kyk 권한 요청
    }
  }

  /**
   * 앨범 사진 로드
   */
  void _loadPhotos(AssetPathEntity assetPathEntity) async {
    _selectedAlbum = assetPathEntity;

    await _pagingPhotos();

    _update();
  }

  /**
   * 사진 페이징
   */
  Future<void> _pagingPhotos() async {
    var photos = await _selectedAlbum!.getAssetListPaged(page: 0, size: 30);

    _photos.clear();
    _photos.addAll(photos);

    _selectedPhoto = _photos.first;
  }

  void _update() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
    var width = MediaQuery.of(context).size.width; // Get.width
    return Container(
      width: width,
      height: width,
      color: Colors.grey,
      child: _selectedPhoto == null
          ? Container()
          : _selectedPhotoWidget(
              _selectedPhoto!,
              width.toInt(),
            ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showAlbumBS();
            },
            child: Row(
              children: [
                Text(
                  _selectedAlbum == null ? "" : _selectedAlbum!.name,
                  style: TextStyle(fontSize: 15),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
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

  /**
   * 앨범 바텀시트 오픈
   */
  void showAlbumBS() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      // isScrollControlled: true,
      builder: (context) => Container(
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(top: 15, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    _albums.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _loadPhotos(_albums[index]);
                        // Get.back;
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Text(_albums[index].name),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageSelectList() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      // 외부에 SingleChildScrollView 있기 때문에 GridView 스크롤 제거
      shrinkWrap: true,
      // 외부에 SingleChildScrollView 있기 때문에 GridView 스크롤 제거
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: _photos.length,
      itemBuilder: (context, index) {
        var assetEntity = _photos[index];
        return _photoWidget(assetEntity, 200);
      },
    );
  }

  Widget _photoWidget(AssetEntity assetEntity, int size) {
    return FutureBuilder(
      future: assetEntity.thumbnailDataWithSize(
        ThumbnailSize(size, size),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return GestureDetector(
          onTap: () {
            _selectedPhoto = assetEntity;
            _update();
          },
          child: Opacity(
            opacity: assetEntity == _selectedPhoto ? 0.3 : 1,
            child: Image.memory(
              snapshot.data!,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _selectedPhotoWidget(AssetEntity assetEntity, int size) {
    return FutureBuilder(
      future: assetEntity.thumbnailDataWithSize(
        ThumbnailSize(size, size),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return Image.memory(
          snapshot.data!,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
