import 'dart:developer';

import 'package:dota_2_trivia_app/data/database/trivia_database.dart';
import 'package:dota_2_trivia_app/data/local/trivia_template_json.dart';
import 'package:dota_2_trivia_app/data/model/question/question.dart';
import 'package:dota_2_trivia_app/data/model/template/template_item.dart';

const steamAssetURL = 'https://cdn.cloudflare.steamstatic.com';

class TriviaRepository {
  TriviaRepository(this._triviaTemplateData, this._triviaDatabase);

  final TriviaTemplateData _triviaTemplateData;
  final TriviaDatabase _triviaDatabase;

  Future<QuestionItem?> getQuestion() async {
    final randomTemplate = await _triviaTemplateData.getRandomTemplate();
    final question = await _generateQuestion(randomTemplate);

    if (question != null) {
      await _triviaDatabase.insertQuestion(question);

      var questions = await _triviaDatabase.getQuestions();
      log('$runtimeType : $questions');
    }

    return question;
  }

  Future<QuestionItem?> _generateQuestion(TemplateItem template) async {
    switch (template.id) {
      case 1:
        final heroes = await _triviaDatabase.get4RandomHeroes();
        final hero = (heroes..shuffle()).first;
        final labels = ['a', 'b', 'c', 'd'];

        return QuestionItem.fromJson({
          'question': template.question,
          'image_url': '$steamAssetURL/${hero.imageUrl}',
          'option_type': template.optionType.name,
          'template_id': template.id,
          'hide_label': false,
          'options': (heroes..shuffle())
              .map(
                (option) => {
                  'label': labels[heroes.indexOf(option)],
                  'content': option.name,
                  'correct': hero.id == option.id,
                  'icon_url': null,
                },
              )
              .toList()
        });
      default:
        return null;
    }
  }
}

class TemplateNotFoundException implements Exception {
  final message = 'Template is not found';
}
