// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getCategoriesQueryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesQueryResponse _$GetCategoriesQueryResponseFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesQueryResponse(
      (json['data'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GetCategoriesQueryResponseToJson(
        GetCategoriesQueryResponse instance) =>
    <String, dynamic>{
      'data': instance.categories,
    };
