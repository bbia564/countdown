import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import 'album_first_logic.dart';

class AlbumFirstPage extends GetView<AlbumFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown day'),
        actions: [
          Icon(
            Icons.add_circle,
            size: 25,
            color: primaryColor,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/date_add')?.then((_) {
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
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    child: <Widget>[
                      Text(
                        entity.title,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      <Widget>[
                        SizedBox(
                          child: Stack(
                            children: [
                              Container(
                                width: 200,
                                height: 8,
                              ).decorated(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(4)),
                              Container(
                                      width: (entity.isOut || entity.targetTime
                                          .difference(
                                          entity.createTime)
                                          .inDays == 0)
                                          ? 200
                                          : 200 *
                                              ((entity.targetTime
                                                  .difference(
                                                  entity.createTime)
                                                  .inDays-entity.targetTime
                                                  .difference(
                                                  DateTime.now())
                                                  .inDays) /
                                                  entity.targetTime
                                                      .difference(
                                                          entity.createTime)
                                                      .inDays),
                                      height: 8)
                                  .decorated(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(4))
                            ],
                          ),
                        ),
                        entity.isOut
                            ? const Text(
                                'Expired',
                                style: TextStyle(color: Colors.red),
                              )
                            : <Widget>[
                              Text(
                                  '${entity.remainingDays} days',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                ),
                                const Text(
                                  'Remaining',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                )
                              ].toColumn(
                                crossAxisAlignment: CrossAxisAlignment.end)
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                      Text(
                        entity.targetTimeString,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                  )
                      .decorated(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12))
                      .marginOnly(bottom: 10);
                },
              );
      }),
    );
  }
}
