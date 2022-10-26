import 'package:json_annotation/json_annotation.dart';

part 'hero_item.g.dart';

@JsonSerializable()
class HeroItem {
  HeroItem({
    required this.id,
    required this.name,
    required this.primaryAttr,
    required this.img,
  });

  final int id;
  @JsonKey(name: 'localized_name')
  final String name;
  @JsonKey(name: 'primary_attr')
  final String primaryAttr;
  final String img;

  factory HeroItem.fromJson(Map<String, dynamic> json) =>
      _$HeroItemFromJson(json);

  Map<String, dynamic> toJson() => _$HeroItemToJson(this);
}
