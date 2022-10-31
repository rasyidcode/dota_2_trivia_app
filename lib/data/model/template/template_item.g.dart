// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemplateItem _$TemplateItemFromJson(Map<String, dynamic> json) => TemplateItem(
      id: json['id'] as int,
      question: json['question'] as String,
      optionType: $enumDecode(_$OptionTypeEnumMap, json['option_type']),
    );

Map<String, dynamic> _$TemplateItemToJson(TemplateItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'option_type': _$OptionTypeEnumMap[instance.optionType]!,
    };

const _$OptionTypeEnumMap = {
  OptionType.text: 'text',
  OptionType.textIcon: 'text_icon',
  OptionType.image: 'image',
};
