// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) {
  return PokemonModel(
    json['sprites'] == null
        ? null
        : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
  )
    ..species = json['species'] == null
        ? null
        : Species.fromJson(json['species'] as Map<String, dynamic>)
    ..name = json['name'] as String
    ..height = json['height'] as int
    ..weight = json['weight'] as int;
}

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'sprites': instance.sprites?.toJson(),
      'species': instance.species?.toJson(),
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
    };

Species _$SpeciesFromJson(Map<String, dynamic> json) {
  return Species(
    json['name'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) {
  return Sprites(
    json['back_default'] as String,
    json['front_default'] as String,
  );
}

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'back_default': instance.backDefault,
      'front_default': instance.frontDefault,
    };
