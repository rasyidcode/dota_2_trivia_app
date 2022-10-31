// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_abilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroAbilities _$HeroAbilitiesFromJson(Map<String, dynamic> json) =>
    HeroAbilities(
      id: json['id'] as int,
      hero: json['hero'] as String,
      abilities: json['abilities'] as String,
      talents: json['talents'] as String,
    );

Map<String, dynamic> _$HeroAbilitiesToJson(HeroAbilities instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hero': instance.hero,
      'abilities': instance.abilities,
      'talents': instance.talents,
    };
