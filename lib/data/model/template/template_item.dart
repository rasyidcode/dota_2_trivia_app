import 'package:dota_2_trivia_app/data/model/common/option_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'template_item.g.dart';

@JsonSerializable()
class TemplateItem {
  TemplateItem({
    required this.id,
    required this.question,
    required this.optionType,
  });

  final int id;
  final String question;
  @JsonKey(name: 'option_type')
  final OptionType optionType;

  factory TemplateItem.fromJson(Map<String, dynamic> json) =>
      _$TemplateItemFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateItemToJson(this);
}
