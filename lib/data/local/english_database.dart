import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EnglishDatabase {
  static const String database_name = 'english_database.db';
  static const String english_topics_table_name = 'english_topics';
  static const String english_vocabularies_table_name = 'english_vocabularies';

  static Database? _db;

  static Future<Database?> getInstance() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$database_name');

    _db ??= await openDatabase(path, version: 4,
        onCreate: (Database db, int version) async {
      db.execute(
          'CREATE TABLE $english_topics_table_name (id INTERGER PRIMARY KEY, name TEXT, description_en TEXT, image_url TEXT)');

      db.execute(
          'CREATE TABLE $english_vocabularies_table_name (word INTERGER PRIMARY KEY, meaning_vi TEXT, topic_id INTERGER)');
    });

    return _db;
  }

  static close() async {
    await _db?.close();
  }
}
