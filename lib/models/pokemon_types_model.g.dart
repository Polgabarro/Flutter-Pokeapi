// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonTypesResponse _$PokemonTypesResponseFromJson(Map<String, dynamic> json) {
  return PokemonTypesResponse(
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : PokeType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonTypesResponseToJson(
        PokemonTypesResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

PokeType _$PokeTypeFromJson(Map<String, dynamic> json) {
  return PokeType(
    json['name'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$PokeTypeToJson(PokeType instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
