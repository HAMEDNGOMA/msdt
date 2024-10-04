
import 'models/category.dart';

class GetCategoriesQueryResponse {
  final List<Category> categories;

  GetCategoriesQueryResponse({List<Category>? categories})
      : categories = categories ?? [];

  // Custom fromJson method
  factory GetCategoriesQueryResponse.fromJson(Map<String, dynamic> json) {
    var categoryList = json['data'] as List<dynamic>? ?? [];
    List<Category> categories = categoryList
        .map((item) => Category.fromJson(item as Map<String, dynamic>))
        .toList();

    return GetCategoriesQueryResponse(categories: categories);
  }

  // Custom toJson method
  Map<String, dynamic> toJson() {
    return {
      'data': categories.map((category) => category.toJson()).toList(),
    };
  }
}
