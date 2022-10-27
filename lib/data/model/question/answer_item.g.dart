// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerItem _$AnswerItemFromJson(Map<String, dynamic> json) => AnswerItem(
      label: json['label'] as String,
      content: json['content'] as String,
      correct: json['correct'] as bool,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$AnswerItemToJson(AnswerItem instance) =>
    <String, dynamic>{
      'label': instance.label,
      'content': instance.content,
      'correct': instance.correct,
      'icon': instance.icon,
    };
