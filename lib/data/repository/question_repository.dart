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

    List<Map<String, dynamic>> templates = [
      {
        "id": 1,
        "question": 'What is the name of this hero?',
        "answer_type": 'text',
      },
      {
        "id": 2,
        "question": 'Which of these hero named {replace}?',
        "answer_type": 'image',
      },
      {
        "id": 3,
        "question": 'What is the primary attribute of this hero?',
        "answer_type": 'text',
      },
    ];
    List<String> labels = ['a', 'b', 'c', 'd'];

    (heroesResult.heroes..shuffle()).take(10).forEach((hero) {
      Map<String, dynamic> template = (templates..shuffle()).first;
      List<HeroItem> options = (heroesResult.heroes
            ..shuffle()
            ..removeWhere((element) => element.id == hero.id))
          .take(3)
          .toList()
        ..add(hero)
        ..shuffle();

      Map<String, dynamic> question;

      if (template['id'] == 1) {
        question = {
          "question": template['question'],
          "image": '$steamAssetURL/${hero.img}',
          "answers": options
              .map((item) => {
                    "label": labels[options.indexOf(item)],
                    "content": item.name,
                    "correct": item.id == hero.id
                  })
              .toList(),
          "answer_type": "text",
          "template_id": template['id'],
        };
      } else if (template['id'] == 2) {
        String formedQuestion = (template['question'] as String)
            .replaceFirst(RegExp(r'{replace}'), hero.name);
        question = {
          "question": formedQuestion,
          "image": null,
          "answers": options
              .map((item) => {
                    "label": labels[options.indexOf(item)],
                    "content": '$steamAssetURL${item.img}',
                    "correct": item.id == hero.id
                  })
              .toList(),
          "answer_type": "image",
          "template_id": template['id'],
        };
      } else if (template['id'] == 3) {
        List<String> customOptions = [
          'str',
          'agi',
          'int',
        ];
        question = {
          "question": template['question'],
          "image": '$steamAssetURL/${hero.img}',
          "answers": customOptions
              .map((item) => {
                    "label": labels[customOptions.indexOf(item)],
                    "content": item,
                    "correct": item == hero.primaryAttr,
                  })
              .toList(),
          "answer_type": "text",
          "template_id": template['id'],
        };
      } else {
        question = {};
      }

      (questions['questions'] as List).add(question);
    });

    return QuestionResult.fromJson(questions).questions;
  }
}

class HeroesEmptyException implements Exception {
  final message = 'Heroes is empty';
}
