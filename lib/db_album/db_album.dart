import 'dart:convert';
import 'package:autograph_album/db_album/album_entity.dart';
import 'package:autograph_album/db_album/date_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBAlbum extends GetxService {
  late Database dbBase;

  Future<DBAlbum> init() async {
    await createAlbumDB();
    return this;
  }

  createAlbumDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'album.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createAlbumTable(db);
          await createDateTable(db);
        });
  }

  createAlbumTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS album (id INTEGER PRIMARY KEY, createTime TEXT, image BLOB, title TEXT)');
  }

  createDateTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS date (id INTEGER PRIMARY KEY, createTime TEXT, title TEXT, targetTime TEXT, isWarn INTEGER)');
  }

  insertAlbum(AlbumEntity entity) async {
    final id = await dbBase.insert('album', {
      'createTime': entity.createTime.toIso8601String(),
      'image': entity.image,
      'title': entity.title
    });
    return id;
  }

  insertDate(DateEntity entity) async {
    final id = await dbBase.insert('date', {
      'createTime': entity.createTime.toIso8601String(),
      'title': entity.title,
      'targetTime': entity.targetTime.toIso8601String(),
      'isWarn': entity.isWarn
    });
    return id;
  }

  updateDate(DateEntity entity) async {
    await dbBase.update('date', {
      'createTime': entity.createTime.toIso8601String(),
      'title': entity.title,
      'targetTime': entity.targetTime.toIso8601String(),
      'isWarn': entity.isWarn
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanAllData() async {
    await dbBase.delete('album');
    await dbBase.delete('date');
  }

  Future<List<AlbumEntity>> getAlbumAllData() async {
    var result = await dbBase.query('album', orderBy: 'createTime DESC');
    return result.map((e) => AlbumEntity.fromJson(e)).toList();
  }

  Future<List<DateEntity>> getDateAllData() async {
    var result = await dbBase.query('date', orderBy: 'createTime DESC');
    return result.map((e) => DateEntity.fromJson(e)).toList();
  }
}
