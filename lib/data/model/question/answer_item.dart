import 'package:json_annotation/json_annotation.dart';

part 'answer_item.g.dart';

@JsonSerializable()
class AnswerItem {
  AnswerItem({
    required this.label,
    required this.content,
    required this.correct,
    this.icon,
  });

  final String label;
  final String content;
  final bool correct;
  final String? icon;

  factory AnswerItem.fromJson(Map<String, dynamic> json) =>
      _$AnswerItemFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerItemToJson(this);
}
