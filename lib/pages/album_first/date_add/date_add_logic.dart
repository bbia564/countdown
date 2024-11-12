import 'package:autograph_album/db_album/date_entity.dart';
import 'package:autograph_album/db_album/db_album.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateAddLogic extends GetxController {

  DBAlbum dbAlbum = Get.find<DBAlbum>();

  String title  = '';
  DateTime? targetTime;
  String targetTimeStr = '';

  bool isRemind  = true;

  void timeSelect(BuildContext context) {
    DatePicker.showDatePicker(context,minDateTime: DateTime.now(),dateFormat: 'yyyy-MM-dd',onConfirm: (date,list) {
      targetTime = date;
      targetTimeStr = DateFormat('yyyy-MM-dd').format(date);
      update();
    });
  }
  
  void add(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter event name');
      return;
    }
    if (targetTime == null) {
      Fluttertoast.showToast(msg: 'Please select date');
      return;
    }
    final entity = DateEntity(id: 0, createTime: DateTime.now(), title: title, targetTime: targetTime!, isWarn: isRemind ? 1 : 0);
    await dbAlbum.insertDate(entity);
    Get.back();
  }

}
