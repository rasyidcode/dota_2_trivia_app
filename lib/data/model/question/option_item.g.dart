// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionItem _$OptionItemFromJson(Map<String, dynamic> json) => OptionItem(
      label: json['label'] as String,
      content: json['content'] as String,
      correct: json['correct'] as bool,
      iconUrl: json['icon_url'] as String?,
    );

Map<String, dynamic> _$OptionItemToJson(OptionItem instance) =>
    <String, dynamic>{
      'label': instance.label,
      'content': instance.content,
      'correct': instance.correct,
      'icon_url': instance.iconUrl,
    };
