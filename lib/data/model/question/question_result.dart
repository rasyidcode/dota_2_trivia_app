import 'package:dota_2_trivia_app/data/model/question/question.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_result.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionResult {
  QuestionResult({required this.questions, required this.createdAt});

  final List<QuestionItem> questions;
  @JsonKey(name: 'created_at')
  final String createdAt;

  factory QuestionResult.fromJson(Map<String, dynamic> json) =>
      _$QuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResultToJson(this);
}
