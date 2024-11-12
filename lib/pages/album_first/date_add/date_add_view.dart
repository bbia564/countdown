import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';
import '../../album_third/feedback/album_text_field.dart';
import 'date_add_logic.dart';

class DateAddPage extends GetView<DateAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add countdown day"),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<DateAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: <Widget>[
                  const Text(
                    'Event name',
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
                  Divider(
                    height: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ).marginOnly(bottom: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    child: <Widget>[
                      const Text(
                        'Date',
                        style: TextStyle(fontSize: 14),
                      ),
                      Expanded(
                          child: IgnorePointer(
                        child: AlbumTextField(
                            hintText: 'Select date',
                            textAlign: TextAlign.end,
                            value: controller.targetTimeStr,
                            onChange: (_) {}),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        size: 20,
                        color: Colors.grey,
                      )
                    ].toRow(),
                  )
                      .decorated(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12))
                      .gestures(onTap: () {
                    controller.timeSelect(context);
                  })
                ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: <Widget>[
                  const Text(
                    'Whether to remind',
                    style: TextStyle(fontSize: 14),
                  ),
                  Switch(activeTrackColor: Colors.green,value: controller.isRemind, onChanged: (value) {
                    controller.isRemind = !controller.isRemind;
                    controller.update();
                  })
                ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
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
                controller.add(context);
              })
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
