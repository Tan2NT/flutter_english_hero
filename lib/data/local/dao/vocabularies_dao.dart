import 'package:english_hero/data/common/model/english/vocabulary.dart';
import 'package:english_hero/data/local/english_database.dart';
import 'package:sqflite/sqflite.dart';

class EnglishVocabulariesDAO {
  Database? _db;

  EnglishVocabulariesDAO() {
    _getDbInstance();
  }

  void _getDbInstance() async => _db = await EnglishDatabase.getInstance();

  Future<List<VocabularyEntity>> getVocabulariesByTopic(int topicId) async {
    if (_db == null) return [];
    List<Map<String, dynamic>> maps = [];

    try {
      maps = await _db!.rawQuery(
          'SELECT * from ${EnglishDatabase.english_vocabularies_table_name} WHERE topic_id = $topicId');
    } catch (error) {
      print(error.toString());
    }

    return maps.isNotEmpty
        ? maps.map((e) => VocabularyEntity.fromJson(e)).toList()
        : [];
  }

  Future<void> insert(List<VocabularyEntity> vocabularies) async {
    if (_db == null) return;
    final batch = _db!.batch();

    for (var vocab in vocabularies) {
      _db!.insert(
          EnglishDatabase.english_vocabularies_table_name, vocab.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}
