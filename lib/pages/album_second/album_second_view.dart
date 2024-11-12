import 'package:autograph_album/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'album_second_logic.dart';

class AlbumSecondPage extends GetView<AlbumSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        actions: [
          Icon(
            Icons.add_circle,
            size: 25,
            color: primaryColor,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/album_add')?.then((_) {
              controller.getData();
            });
          })
        ],
      ),
      body: Obx(() {
        return controller.list.value.isEmpty
            ? Center(
                child: <Widget>[
                  Image.asset(
                    'assets/noData.webp',
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'No data',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 166.0 / 218.0),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    child: <Widget>[
                      Expanded(
                          child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        child: Image.memory(
                          entity.image,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )),
                      Text(
                        entity.title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ).marginSymmetric(vertical: 15)
                    ].toColumn(),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xffe8e8e8)));
                });
      }),
    );
  }
}
