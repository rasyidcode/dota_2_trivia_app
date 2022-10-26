import 'package:dota_2_trivia_app/data/model/question/answer_item.dart';

import 'package:json_annotation/json_annotation.dart';

part 'question_item.g.dart';

@JsonSerializable()
class QuestionItem {
  QuestionItem({
    required this.question,
    required this.image,
    required this.answers,
    required this.answerType,
    required this.templateId,
  });

  final String question;
  final String? image;
  final List<AnswerItem> answers;
  @JsonKey(name: 'answer_type')
  final String answerType;
  @JsonKey(name: 'template_id')
  final int templateId;

  factory QuestionItem.fromJson(Map<String, dynamic> json) =>
      _$QuestionItemFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionItemToJson(this);
}
