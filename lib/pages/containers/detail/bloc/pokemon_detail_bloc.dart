import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pokedex/repositories/poke_api_repository.dart';
import './bloc.dart';

class PokemonDetailBloc extends Bloc<PokemonDetailEvent, PokemonDetailState> {

  final PokeApiRepository repository;

  PokemonDetailBloc(this.repository);

  @override
  PokemonDetailState get initialState => InitialPokemonDetailState();

  @override
  Stream<PokemonDetailState> mapEventToState(
    PokemonDetailEvent event,
  ) async* {
    if(event is GetPokemonEvent) {
      try {
        yield LoadingPokemonDetailState();
        final response = await repository.getPokemonDetail(event.pokemonName);
        yield LoadedPokemonDetailState(response);
      }catch(e) {
        print(e);
        yield ErrorPokemonDetailState();
      }
    }
  }
}
