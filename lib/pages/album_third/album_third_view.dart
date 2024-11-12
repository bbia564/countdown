import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'album_third_logic.dart';

class AlbumThirdPage extends GetView<AlbumThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = [
      'Clean all records',
      'Feedback',
      'About app'
    ];
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: <Widget>[
        Text(
          titles[index],
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        ),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(8))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanAlbumData();
          break;
        case 1:
          Get.toNamed('/feedback');
          break;
        case 2:
          controller.aboutAlbumApp(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mine'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            _item(0, context),
            _item(1, context),
            _item(2, context),
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
