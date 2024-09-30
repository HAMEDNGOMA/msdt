import 'package:json_annotation/json_annotation.dart';
import 'package:msdt/models/category.dart';

part 'getCategoriesQueryResponse.g.dart';

@JsonSerializable()
class GetCategoriesQueryResponse {
  @JsonKey(name: 'data', defaultValue: [])
  final List<Category> categories;

  GetCategoriesQueryResponse(this.categories);

  factory GetCategoriesQueryResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesQueryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCategoriesQueryResponseToJson(this);
}
