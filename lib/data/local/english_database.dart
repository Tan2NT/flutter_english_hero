import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EnglishDatabase {
  static const String database_name = 'english_database.db';
  static const String english_topic_table_name = 'english_topics';

  static Database? _db;

  static Future<Database?> getInstance() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, '$database_name');

    _db ??= await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE $english_topic_table_name (id INTERGER PRIMARY KEY, name TEXT, description_en TEXT, image_url TEXT)');
    });

    return _db;
  }

  static close() async {
    await _db?.close();
  }
}
