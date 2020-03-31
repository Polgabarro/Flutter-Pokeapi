import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonModel {
  Sprites sprites;

  PokemonModel(this.sprites);

  factory PokemonModel.fromJson(Map<String, dynamic> json) => _$PokemonModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  @override
  String toString() {
    return 'PokemonModel{sprites: $sprites}';
  }
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'back_default')
  String backDefault;
  @JsonKey(name: 'front_default')
  String frontDefault;

  Sprites(this.backDefault, this.frontDefault);

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
  Map<String, dynamic> toJson() => _$SpritesToJson(this);

  @override
  String toString() {
    return 'Sprites{backDefault: $backDefault, frontDefault: $frontDefault}';
  }


}