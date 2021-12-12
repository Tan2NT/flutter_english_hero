import 'package:english_hero/domain/model/english/topic.dart';
import 'package:english_hero/domain/usecase/english/fetch_all_topics_use_case.dart';
import 'package:english_hero/presentation/utils/constants.dart';
import 'package:english_hero/presentation/utils/shared_preference_util.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scoped_model/scoped_model.dart';

class EnglishTopicsViewModel extends Model {
  List<EnglishTopic> englisTopics = [];
  final FetchAllTopicsUseCase _fetchAllTopicsUseCase;

  EnglishTopicsViewModel(this._fetchAllTopicsUseCase);

  Future<List<EnglishTopic>> fetchAllTopics() async {
    final fetchedTopics = await _fetchAllTopicsUseCase
        .execute(PreferenceUtils.getString(Constants.USER_TOKEN_KEY));
    updateTopics(fetchedTopics);
    return fetchedTopics;
  }

  void updateTopics(List<EnglishTopic> newTopics) {
    if (newTopics.isNotEmpty) {
      englisTopics.clear();
      englisTopics = newTopics;
      notifyListeners();
    }
  }
}
