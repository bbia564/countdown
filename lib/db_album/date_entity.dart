import 'package:intl/intl.dart';

class DateEntity {
  int id;
  DateTime createTime;
  String title;
  DateTime targetTime;
  int isWarn;

  DateEntity(
      {required this.id,
      required this.createTime,
      required this.title,
      required this.targetTime,
      required this.isWarn});

  factory DateEntity.fromJson(Map<String, dynamic> json) => DateEntity(
      id: json['id'],
      createTime: DateTime.parse(json['createTime']),
      title: json['title'],
      targetTime: DateTime.parse(json['targetTime']),
      isWarn: json['isWarn']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'createTime': createTime.toIso8601String(),
        'title': title,
        'targetTime': targetTime.toIso8601String(),
        'isWarn': isWarn
      };

  bool get isOut {
    return DateTime.now().isAfter(targetTime);
  }

  int get remainingDays {
    if (isOut) return 0;
    return targetTime.difference(DateTime.now()).inDays;
  }

  List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  String get targetTimeString {
    var result = 'targetTime: ';
    final dateResult = DateFormat('yyyy/MM/dd').format(targetTime);
    result += dateResult;
    result += ' ';
    result += daysOfWeek[targetTime.weekday];
    return result;
  }
}
