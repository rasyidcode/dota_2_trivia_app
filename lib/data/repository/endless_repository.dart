import 'package:dota_2_trivia_app/data/model/question/question.dart';
import 'package:dota_2_trivia_app/data/network/dota_data_source.dart';

const steamAssetURL = 'https://cdn.cloudflare.steamstatic.com';

class EndlessRepository {
  EndlessRepository(this._dotaDataSource);

  final DotaDataSource _dotaDataSource;

  Future<List<QuestionItem>> fetchQuestions() async {
    final heroesResult = await _dotaDataSource.fetchHeroes();

    if (heroesResult.heroes.isEmpty) {
      throw HeroesEmptyException();
    }

    return [];
  }

  Future<QuestionItem?> fetchQuestion() async {
    return null;
  }
}

class HeroesEmptyException implements Exception {
  final message = 'Heroes is empty';
}
