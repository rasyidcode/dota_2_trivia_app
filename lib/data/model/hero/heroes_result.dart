import 'package:dota_2_trivia_app/data/model/hero/hero_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'heroes_result.g.dart';

@JsonSerializable(explicitToJson: true)
class HeroesResult {
  HeroesResult({required this.heroes});

  final List<HeroItem> heroes;

  factory HeroesResult.fromJson(Map<String, dynamic> json) =>
      _$HeroesResultFromJson(json);

  Map<String, dynamic> toJson() => _$HeroesResultToJson(this);
}
