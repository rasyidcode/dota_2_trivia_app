import 'package:json_annotation/json_annotation.dart';

part 'hero_abilities.g.dart';

@JsonSerializable()
class HeroAbilities {
  HeroAbilities({
    required this.id,
    required this.hero,
    required this.abilities,
    required this.talents,
  });

  final int id;
  final String hero;
  final String abilities;
  final String talents;

  factory HeroAbilities.fromJson(Map<String, dynamic> json) =>
      _$HeroAbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$HeroAbilitiesToJson(this);
}
