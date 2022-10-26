import 'dart:developer';

import 'package:dota_2_trivia_app/data/model/hero/hero_item.dart';
import 'package:dota_2_trivia_app/data/model/question/question.dart';
import 'package:dota_2_trivia_app/data/model/question/question_result.dart';
import 'package:dota_2_trivia_app/data/network/dota_data_source.dart';

const steamAssetURL = 'https://cdn.cloudflare.steamstatic.com';

class QuestionRepository {
  QuestionRepository(this._dotaDataSource);

  final DotaDataSource _dotaDataSource;

  Future<List<QuestionItem>> fetchQuestions() async {
    final heroesResult = await _dotaDataSource.fetchHeroes();

    if (heroesResult.heroes.isEmpty) {
      throw HeroesEmptyException();
    }

    Map<String, dynamic> questions = {
      "questions": [],
      "created_at": DateTime.now().toString()
    };

    (heroesResult.heroes..shuffle()).take(10).forEach((hero) {
      Map<String, dynamic> question = {
        "question": "What is the name of this hero?",
        "image": '$steamAssetURL/${hero.img}',
        "answers": [],
      };

      List<HeroItem> options = (heroesResult.heroes
            ..shuffle()
            ..removeWhere((element) => element.id == hero.id))
          .take(3)
          .toList();

      options.add(hero);
      options.shuffle();

      List<String> labels = ['a', 'b', 'c', 'd'];

      List<Map<String, dynamic>> answers = options
          .map((item) => {
                "label": labels[options.indexOf(item)],
                "content": item.name,
                "correct": item.id == hero.id
              })
          .toList();

      question['answers'] = answers;

      (questions['questions'] as List).add(question);
    });

    return QuestionResult.fromJson(questions).questions;
  }
}

class HeroesEmptyException implements Exception {
  final message = 'Heroes is empty';
}
