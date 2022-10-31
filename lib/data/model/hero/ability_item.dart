import 'package:json_annotation/json_annotation.dart';

part 'ability_item.g.dart';

@JsonSerializable()
class AbilityItem {
  AbilityItem();

  // final

  factory AbilityItem.fromJson(Map<String, dynamic> json) =>
      _$AbilityItemFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityItemToJson(this);
}
