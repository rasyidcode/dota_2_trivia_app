// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroes_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroesResult _$HeroesResultFromJson(Map<String, dynamic> json) => HeroesResult(
      heroes: (json['heroes'] as List<dynamic>)
          .map((e) => HeroItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeroesResultToJson(HeroesResult instance) =>
    <String, dynamic>{
      'heroes': instance.heroes.map((e) => e.toJson()).toList(),
    };
