import 'package:autograph_album/main.dart';
import 'package:autograph_album/pages/album_third/feedback/album_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'album_add_logic.dart';

class AlbumAddPage extends GetView<AlbumAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Events"),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<AlbumAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  const Text(
                    'Events name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: AlbumTextField(
                        maxLines: 15,
                        value: controller.title,
                        onChange: (value) {
                          controller.title = value;
                        }),
                  ),
                  Divider(height: 1,color: Colors.grey.withOpacity(0.3),),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Events cover',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 90,
                        height: 90,
                        child: controller.image == null
                            ? Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: primaryColor,
                        )
                            : Image.memory(
                          controller.image!,
                          fit: BoxFit.cover,
                        ).decorated(color: Colors.grey[200]),
                      ).decorated(color: Colors.grey[200]).gestures(onTap: () {
                        controller.imageSelected();
                      })),
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: const Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ).decorated(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)).gestures(onTap: (){
                    controller.addAlbum(context);
              })
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
