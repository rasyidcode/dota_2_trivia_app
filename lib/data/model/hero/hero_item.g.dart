// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroItem _$HeroItemFromJson(Map<String, dynamic> json) => HeroItem(
      id: json['id'] as int,
      name: json['localized_name'] as String,
      primaryAttr: json['primary_attr'] as String,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$HeroItemToJson(HeroItem instance) => <String, dynamic>{
      'id': instance.id,
      'localized_name': instance.name,
      'primary_attr': instance.primaryAttr,
      'img': instance.img,
    };
