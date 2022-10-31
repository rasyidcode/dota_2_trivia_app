// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroItem _$HeroItemFromJson(Map<String, dynamic> json) => HeroItem(
      id: json['id'] as int,
      code: json['code'] as String?,
      name: json['name'] as String?,
      primaryAttr: json['primary_attr'] as String?,
      attackType: json['attack_type'] as String?,
      imageUrl: json['image_url'] as String?,
      iconUrl: json['icon_url'] as String?,
      moveSpeed: json['move_speed'] as int?,
      legs: json['legs'] as int?,
    );

Map<String, dynamic> _$HeroItemToJson(HeroItem instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'primary_attr': instance.primaryAttr,
      'attack_type': instance.attackType,
      'image_url': instance.imageUrl,
      'icon_url': instance.iconUrl,
      'move_speed': instance.moveSpeed,
      'legs': instance.legs,
    };
