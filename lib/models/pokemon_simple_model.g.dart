// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_simple_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSimpleResponseModel _$PokemonSimpleResponseModelFromJson(
    Map<String, dynamic> json) {
  return PokemonSimpleResponseModel(
    json['count'] as int,
    json['next'] as String,
    json['previous'] as String,
    (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : PokemonSimpleModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonSimpleResponseModelToJson(
        PokemonSimpleResponseModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

PokemonSimpleModel _$PokemonSimpleModelFromJson(Map<String, dynamic> json) {
  return PokemonSimpleModel(
    json['name'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PokemonSimpleModelToJson(PokemonSimpleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
