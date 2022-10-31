import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option_item.g.dart';

@JsonSerializable()
class OptionItem extends Equatable {
  const OptionItem({
    required this.label,
    required this.content,
    required this.correct,
    this.iconUrl,
  });

  final String label;
  final String content;
  final bool correct;
  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  factory OptionItem.fromJson(Map<String, dynamic> json) =>
      _$OptionItemFromJson(json);

  Map<String, dynamic> toJson() => _$OptionItemToJson(this);

  @override
  List<Object?> get props => [
        label,
        content,
        correct,
        iconUrl,
      ];
}
