import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'id', defaultValue: null)
  final int? id;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  const Category({this.id, this.name = ''});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
