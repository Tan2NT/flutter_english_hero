import 'package:english_hero/data/common/model/english/topic_entity.dart';
import 'package:english_hero/data/local/english_database_helper.dart';
import 'package:sqflite/sqflite.dart';

class EnglishTopicDAO extends EnglishDatabaseHelper {
  Future<void> insert(List<EnglishTopicEntity> topics) async {
    await openDb();
    final batch = db!.batch();

    for (var topic in topics) {
      batch.insert(EnglishDatabaseHelper.topicTableName, topic.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
    return;
  }

  Future<List<EnglishTopicEntity>> getTopics() async {
    await openDb();
    List<Map> maps = await db!
        .rawQuery('SELECT * from ${EnglishDatabaseHelper.topicTableName}');
    if (maps.isEmpty) return [];
    return maps.map((topic) => EnglishTopicEntity.fromMap(topic)).toList();
  }

  Future updatevocabularyCountOfTopic(int topicId, int vocabularyCount) async {
    await openDb();
    db!.rawUpdate(
        'UPDATE ${EnglishDatabaseHelper.topicTableName} SET vocabulary_count = $vocabularyCount WHERE id = $topicId');
    return;
  }
}
