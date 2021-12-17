import 'package:english_hero/data/common/model/english/vocabulary.dart';
import 'package:english_hero/data/local/english_database_helper.dart';
import 'package:sqflite/sqflite.dart';

class EnglishVocabulariesDAO extends EnglishDatabaseHelper {
  Future<List<VocabularyEntity>> getVocabulariesByTopic(int topicId) async {
    await openDb();
    if (db == null) return [];
    List<Map<String, dynamic>> maps = [];

    maps = await db!.rawQuery(
        'SELECT * from ${EnglishDatabaseHelper.vocabularyTableName} WHERE topic_id = $topicId');

    return maps.isNotEmpty
        ? maps.map((e) => VocabularyEntity.fromMap(e)).toList()
        : [];
  }

  Future<void> insert(List<VocabularyEntity> vocabularies) async {
    await openDb();
    if (db == null) return;
    final batch = db!.batch();

    for (var vocab in vocabularies) {
      batch.insert(EnglishDatabaseHelper.vocabularyTableName, vocab.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit();
  }
}
