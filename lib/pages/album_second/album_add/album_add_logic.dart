import 'dart:typed_data';

import 'package:autograph_album/db_album/album_entity.dart';
import 'package:autograph_album/db_album/db_album.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AlbumAddLogic extends GetxController {

  DBAlbum dbAlbum = Get.find<DBAlbum>();

  String title = '';
  Uint8List? image;

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void addAlbum(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter a title');
      return;
    } else if (image == null) {
      Fluttertoast.showToast(msg: 'Please select an image');
      return;
    }
    final entity = AlbumEntity(id: 0, createTime: DateTime.now(), image: image!, title: title);
    await dbAlbum.insertAlbum(entity);
    Get.back();
  }

}
