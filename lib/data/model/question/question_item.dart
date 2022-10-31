import 'package:dota_2_trivia_app/data/model/common/option_type.dart';
import 'package:dota_2_trivia_app/data/model/question/option_item.dart';
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'question_item.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionItem extends Equatable {
  const QuestionItem({
    required this.question,
    this.imageUrl,
    required this.options,
    required this.optionType,
    required this.templateId,
    required this.hideLabel,
  });

  final String question;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final List<OptionItem> options;
  @JsonKey(name: 'option_type')
  final OptionType optionType;
  @JsonKey(name: 'template_id')
  final int templateId;
  @JsonKey(name: 'hide_label')
  final bool hideLabel;

  factory QuestionItem.fromJson(Map<String, dynamic> json) =>
      _$QuestionItemFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionItemToJson(this);

  @override
  List<Object?> get props => [
        question,
        imageUrl,
        options,
        optionType,
        templateId,
        hideLabel,
      ];
}
