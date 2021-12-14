import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class EnglishDatabaseHelper {
  Database? db;
  final _dbName = 'english_database.db';
  static const topicTableName = 'english_topics';
  static const vocabularyTableName = "english_vocabularies";

  Future openDb() async {
    final dbPath = await getDatabasesPath();
    db = await openDatabase(path.join(dbPath, _dbName), version: 2,
        onCreate: (_db, version) async {
      _db.execute(
          'CREATE TABLE $topicTableName (id INTEGER PRIMARY KEY, name TEXT, description_en TEXT, image_url TEXT, vocabulary_count INTEGER)');
      _db.execute(
          'CREATE TABLE $vocabularyTableName (word TEXT PRIMARY KEY, meaning_vi TEXT, topic_id INTERGER)');
    });
  }
}
