import 'package:pokedex/models/pokemon_by_type_model.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/pokemon_simple_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/models/pokemon_types_model.dart';


class PokeApiRepository {
  Future<PokemonSimpleResponseModel> getPokemons({int nextPokemon = 0}) async{
    final response = await http.get('https://pokeapi.co/api/v2/pokemon?offset=$nextPokemon&limit=20');
    if(response.statusCode == 200) {
      return PokemonSimpleResponseModel.fromJson(json.decode(response.body));
    }else {
      throw Exception('Failed to load Pokemon');
    }
  }

  Future<PokemonModel> getPokemonDetail(String name) async{
    final response = await http.get('https://pokeapi.co/api/v2/pokemon/$name');
    if(response.statusCode == 200) {
      return PokemonModel.fromJson(json.decode(response.body));
    }else {
      throw Exception('Failed to load Pokemon');
    }
  }

  Future<PokemonTypesResponse> getPokemonTypes() async{
    final response = await http.get('https://pokeapi.co/api/v2/type');
    if(response.statusCode == 200) {
      return PokemonTypesResponse.fromJson(json.decode(response.body));
    }else {
      throw Exception('Failed to load Pokemon');
    }
  }

  Future<List<PokemonSimpleModel>> getPokemonByType(String url) async{
    final response = await http.get(url);
    if(response.statusCode == 200) {
      PokemonByType body = PokemonByType.fromJson(json.decode(response.body));

      return body.pokemon.map((PokeByTypeL pokeL) => pokeL.pokemon).toList();
    }else {
      throw Exception('Failed to load Pokemon');
    }
  }
}