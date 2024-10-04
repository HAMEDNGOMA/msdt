import 'dart:convert';

import 'package:dart_mediatr/dart_mediatr.dart';
import 'package:http/http.dart' as http;

import 'getCategoriesQueryResponse.dart';
import 'get_categories_query.dart';

@QueryHandler()
class GetCategoriesHandler extends IQueryHandler<GetCategoriesQuery,
    Future<GetCategoriesQueryResponse>> {
  @override
  Future<GetCategoriesQueryResponse> handle(GetCategoriesQuery query) async {
    final url = Uri.parse('https://backend.zad-almuslim.ly/api/categories');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return GetCategoriesQueryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
