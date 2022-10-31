// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionItem _$QuestionItemFromJson(Map<String, dynamic> json) => QuestionItem(
      question: json['question'] as String,
      imageUrl: json['image_url'] as String?,
      options: (json['options'] as List<dynamic>)
          .map((e) => OptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      optionType: $enumDecode(_$OptionTypeEnumMap, json['option_type']),
      templateId: json['template_id'] as int,
      hideLabel: json['hide_label'] as bool,
    );

Map<String, dynamic> _$QuestionItemToJson(QuestionItem instance) =>
    <String, dynamic>{
      'question': instance.question,
      'image_url': instance.imageUrl,
      'options': instance.options.map((e) => e.toJson()).toList(),
      'option_type': _$OptionTypeEnumMap[instance.optionType]!,
      'template_id': instance.templateId,
      'hide_label': instance.hideLabel,
    };

const _$OptionTypeEnumMap = {
  OptionType.text: 'text',
  OptionType.textIcon: 'text_icon',
  OptionType.image: 'image',
};
