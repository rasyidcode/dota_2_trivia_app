import 'package:dota_2_trivia_app/data/model/question/answer_item.dart';

class QuestionItem {
  QuestionItem({
    required this.id,
    required this.question,
    required this.image,
    required this.answers,
  });

  final String id;
  final String question;
  final String image;
  final List<AnswerItem> answers;
}
