import 'dart:typed_data';

class AlbumEntity {
  int id;
  DateTime createTime;
  Uint8List image;
  String title;

  AlbumEntity({
     required this.id,
     required this.createTime,
     required this.image,
     required this.title
  });

  AlbumEntity.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      createTime = DateTime.parse(json['createTime']),
      image = json['image'],
      title = json['title'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'createTime': createTime.toIso8601String(),
    'image': image,
    'title': title
  };
}