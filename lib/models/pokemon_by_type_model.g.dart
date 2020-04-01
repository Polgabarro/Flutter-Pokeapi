// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_by_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonByType _$PokemonByTypeFromJson(Map<String, dynamic> json) {
  return PokemonByType(
    (json['pokemon'] as List)
        ?.map((e) =>
            e == null ? null : PokeByTypeL.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonByTypeToJson(PokemonByType instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon?.map((e) => e?.toJson())?.toList(),
    };

PokeByTypeL _$PokeByTypeLFromJson(Map<String, dynamic> json) {
  return PokeByTypeL(
    json['pokemon'] == null
        ? null
        : PokemonSimpleModel.fromJson(json['pokemon'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokeByTypeLToJson(PokeByTypeL instance) =>
    <String, dynamic>{
      'pokemon': instance.pokemon?.toJson(),
    };
