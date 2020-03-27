import 'package:pokedex/models/pokemon_simple_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PokeApiRepository {
  Future<PokemonSimpleResponseModel> getPokemons({int nextPokemon = 0}) async{
    print(nextPokemon);
    final response = await http.get('https://pokeapi.co/api/v2/pokemon?offset=$nextPokemon&limit=20');
    if(response.statusCode == 200) {
      return PokemonSimpleResponseModel.fromJson(json.decode(response.body));
    }else {
      throw Exception('Failed to load Pokemon');
    }
  }

  Future getPokemonDetail(int id) {
    return Future.value('hola');
  }
}