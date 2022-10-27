// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionItem _$QuestionItemFromJson(Map<String, dynamic> json) => QuestionItem(
      question: json['question'] as String,
      image: json['image'] as String?,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => AnswerItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      answerType: json['answer_type'] as String,
      templateId: json['template_id'] as int,
      hideLabel: json['hide_label'] as bool,
    );

Map<String, dynamic> _$QuestionItemToJson(QuestionItem instance) =>
    <String, dynamic>{
      'question': instance.question,
      'image': instance.image,
      'answers': instance.answers,
      'answer_type': instance.answerType,
      'template_id': instance.templateId,
      'hide_label': instance.hideLabel,
    };
