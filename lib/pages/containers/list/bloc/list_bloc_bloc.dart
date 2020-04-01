import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pokedex/repositories/poke_api_repository.dart';
import 'bloc.dart';

class PokemonListBloc extends Bloc<ListBlocEvent, ListBlocState> {

  final PokeApiRepository repository;

  PokemonListBloc(this.repository);

  @override
  ListBlocState get initialState => InitialPokemonList(0);

  @override
  Stream<ListBlocState> mapEventToState(
    ListBlocEvent event,
  ) async* {

    final currentState = state;


    if(event is GetPokemonsList) {
      try {
        // Init State
        if(currentState is InitialPokemonList) {
          final response = await repository.getPokemons(nextPokemon: currentState.next);
          yield PokemonListLoaded(response.results, getnextFromURL(response.next));
        }
        // Loading more state
        else if(currentState is PokemonListLoadingMore) {
          yield PokemonListLoadingMore(currentState.pokemons, currentState.next);
        }
        // List Loaded
        else if(currentState is PokemonListLoaded){
          if (currentState.next == null && !event.reset) {
            yield PokemonListLoaded(currentState.pokemons, null);
            return;
          }
          if(event.reset) {
            yield InitialPokemonList(0);
            final response = await repository.getPokemons(nextPokemon: 0);
            yield PokemonListLoaded(response.results, getnextFromURL(response.next));
            return;
          }
          yield PokemonListLoadingMore(currentState.pokemons, currentState.next);
          final response = await repository.getPokemons(nextPokemon: currentState.next);
          yield PokemonListLoaded(currentState.pokemons + response.results, getnextFromURL(response.next));
        }
      } catch(e) {
        yield PokemonListError('Error loading Pokemons');
      }
    }else if(event is GetPokemonsByType) {
      if(event.type == (currentState as PokemonListLoaded).type){
        return;
      }
      try {
        yield InitialPokemonList(0);
        final response = await repository.getPokemonByType(event.type.url);
        yield PokemonListLoaded(response, null, type: event.type);
      }catch(e) {
        yield PokemonListError('Error loading Pokemons');
      }


    }
  }

  int getnextFromURL(String nextUrl) {

    if(nextUrl == null) {
      return null;
    }

    final String firstPart = nextUrl.split('offset=')[1];
    final String secondPart = firstPart.split('&limit')[0];
    final int next = int.parse(secondPart);
    return next;
  }
}
