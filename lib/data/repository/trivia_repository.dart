import 'package:dota_2_trivia_app/data/database/trivia_database.dart';
import 'package:dota_2_trivia_app/data/model/question/question.dart';
import 'package:dota_2_trivia_app/data/network/dota_data_json.dart';

class TriviaRepository {
  TriviaRepository(this._triviaDatabase);

  final TriviaDatabase _triviaDatabase;

  // Future<QuestionItem> getQuestion() async {}
}
