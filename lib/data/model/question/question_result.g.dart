// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResult _$QuestionResultFromJson(Map<String, dynamic> json) =>
    QuestionResult(
      questions: (json['questions'] as List<dynamic>)
          .map((e) => QuestionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$QuestionResultToJson(QuestionResult instance) =>
    <String, dynamic>{
      'questions': instance.questions.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
    };
