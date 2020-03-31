import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/models/pokemon_simple_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


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
    print (PokemonModel.fromJson(json.decode(response.body)).toString());
    if(response.statusCode == 200) {
      return PokemonModel.fromJson(json.decode(response.body));
    }else {
      throw Exception('Failed to load Pokemon');
    }
  }
}