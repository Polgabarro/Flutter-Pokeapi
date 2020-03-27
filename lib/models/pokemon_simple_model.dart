import 'package:json_annotation/json_annotation.dart';

part 'pokemon_simple_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonSimpleResponseModel {
  int count;
  String next;
  String previous;
  List<PokemonSimpleModel> results;

  PokemonSimpleResponseModel(this.count, this.next, this.previous, this.results);

  factory PokemonSimpleResponseModel.fromJson(Map<String, dynamic> json) => _$PokemonSimpleResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSimpleResponseModelToJson(this);
}


@JsonSerializable()
class PokemonSimpleModel {
  String name;
  String url;

  PokemonSimpleModel(this.name, this.url);

  factory PokemonSimpleModel.fromJson(Map<String, dynamic> json) => _$PokemonSimpleModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSimpleModelToJson(this);
}