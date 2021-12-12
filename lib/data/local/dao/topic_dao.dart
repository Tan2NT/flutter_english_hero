import 'package:english_hero/data/common/model/english/topic_entity.dart';
import 'package:english_hero/data/local/english_database.dart';
import 'package:sqflite/sqflite.dart';

class EnglishTopicDAO {
  Database? _db;

  EnglishTopicDAO() {
    _getDbInstance();
  }

  void _getDbInstance() async => _db = await EnglishDatabase.getInstance();

  Future<List<EnglishTopicEntity>> getTopics() async {
    if (_db == null) return [];

    List<Map<String, dynamic>> maps = await _db!
        .rawQuery('SELECT * from ${EnglishDatabase.english_topic_table_name}');

    return maps.isNotEmpty
        ? maps.map((e) => EnglishTopicEntity.fromJson(e)).toList()
        : [];
  }

  Future<void> insert(List<EnglishTopicEntity> topics) async {
    if (_db == null) return;
    final batch = _db!.batch();

    for (var topic in topics) {
      _db!.insert(EnglishDatabase.english_topic_table_name, topic.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}
