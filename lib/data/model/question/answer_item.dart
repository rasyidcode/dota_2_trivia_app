import 'package:json_annotation/json_annotation.dart';

part 'answer_item.g.dart';

@JsonSerializable()
class AnswerItem {
  AnswerItem({
    required this.label,
    required this.content,
    required this.correct,
  });

  final String label;
  final String content;
  final bool correct;

  factory AnswerItem.fromJson(Map<String, dynamic> json) =>
      _$AnswerItemFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerItemToJson(this);
}
