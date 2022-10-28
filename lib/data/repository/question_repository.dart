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
        "difficulty": "easy",
      },
      {
        "id": 2,
        "question": 'Which of these hero named {replace}?',
        "answer_type": 'image',
        "difficulty": "easy",
      },
      {
        "id": 3,
        "question": 'What is the primary attribute of this hero?',
        "answer_type": 'text_icon',
        "difficulty": "easy",
      },
      {
        "id": 4,
        "question": 'Which of these hero has primary attribute of {replace}?',
        "answer_type": 'text_icon',
        "difficulty": "easy",
      },
      {
        "id": 5,
        "question": 'What is the movement speed of this hero?',
        "answer_type": 'text_icon',
        "difficulty": "hard",
      },
      {
        "id": 6,
        "question": 'What is the attack type of this hero?',
        "answer_type": 'text_icon',
        "difficulty": "medium",
      },
    ];
    templates.removeWhere((element) => element['id'] == 4);
    templates.removeWhere((element) => element['id'] == 5);
    templates.removeWhere((element) => element['id'] == 6);

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
          "answer_type": template['answer_type'],
          "template_id": template['id'],
          'hide_label': false,
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
          "answer_type": template['answer_type'],
          "template_id": template['id'],
          'hide_label': false,
        };
      } else if (template['id'] == 3) {
        List<Map<String, dynamic>> customOptions = [
          {
            'code': 'str',
            'name': 'strength',
            'icon':
                'https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/icons/hero_strength.png'
          },
          {
            'code': 'agi',
            'name': 'agility',
            'icon':
                'https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/icons/hero_agility.png'
          },
          {
            'code': 'int',
            'name': 'intelligence',
            'icon':
                'https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota_react/icons/hero_intelligence.png'
          },
        ];
        question = {
          "question": template['question'],
          "image": '$steamAssetURL/${hero.img}',
          "answers": customOptions
              .map((item) => {
                    "label": labels[customOptions.indexOf(item)],
                    "content": item['code'],
                    "icon": item['icon'],
                    "correct": item['code'] == hero.primaryAttr,
                  })
              .toList(),
          "answer_type": template['answer_type'],
          "template_id": template['id'],
          'hide_label': true,
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
