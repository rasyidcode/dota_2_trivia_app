import 'package:json_annotation/json_annotation.dart';

part 'hero_item.g.dart';

@JsonSerializable()
class HeroItem {
  HeroItem({
    required this.id,
    required this.code,
    required this.name,
    required this.primaryAttr,
    required this.attackType,
    required this.imageUrl,
    required this.iconUrl,
    required this.moveSpeed,
    required this.legs,
  });

  final int id;
  final String? code;
  final String? name;
  @JsonKey(name: 'primary_attr')
  final String? primaryAttr;
  @JsonKey(name: 'attack_type')
  final String? attackType;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  @JsonKey(name: 'move_speed')
  final int? moveSpeed;
  final int? legs;

  factory HeroItem.fromJson(Map<String, dynamic> json) =>
      _$HeroItemFromJson(json);

  Map<String, dynamic> toJson() => _$HeroItemToJson(this);
}
