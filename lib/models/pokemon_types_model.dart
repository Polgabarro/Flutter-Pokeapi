import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_types_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonTypesResponse {
  List<PokeType> results;

  PokemonTypesResponse(this.results);

  factory PokemonTypesResponse.fromJson(Map<String, dynamic> json) => _$PokemonTypesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypesResponseToJson(this);
}

@JsonSerializable()
class PokeType implements Equatable {
  final String name;
  final String url;

  PokeType(this.name, this.url);

  factory PokeType.fromJson(Map<String, dynamic> json) => _$PokeTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PokeTypeToJson(this);

  @override
  List<Object> get props => [name, url];

  @override
  String toString() {
    return 'PokeType{name: $name, url: $url}';
  }

}
