import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/pokemon_simple_model.dart';

part 'pokemon_by_type_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonByType {
  List<PokeByTypeL> pokemon;

  PokemonByType(this.pokemon);

  factory PokemonByType.fromJson(Map<String, dynamic> json) => _$PokemonByTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonByTypeToJson(this);
}
@JsonSerializable(explicitToJson: true)
class PokeByTypeL {
  PokemonSimpleModel pokemon;

  PokeByTypeL(this.pokemon);

  factory PokeByTypeL.fromJson(Map<String, dynamic> json) => _$PokeByTypeLFromJson(json);

  Map<String, dynamic> toJson() => _$PokeByTypeLToJson(this);
}