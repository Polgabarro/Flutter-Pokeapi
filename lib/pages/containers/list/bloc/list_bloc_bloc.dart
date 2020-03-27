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
          if (currentState.next == null) {
            yield PokemonListLoaded(currentState.pokemons, null);
            return;
          }
          yield PokemonListLoadingMore(currentState.pokemons, currentState.next);
          final response = await repository.getPokemons(nextPokemon: currentState.next);

          if(response.next == null) {
            yield PokemonListLoaded(currentState.pokemons, null);
            return;
          }

          int next = getnextFromURL(response.next);
          yield PokemonListLoaded(currentState.pokemons + response.results, next);
        }
      } catch(e) {
        print(e);
        yield PokemonListError('Error loading Pokemons');
      }
    }
  }

  int getnextFromURL(String nextUrl) {
    final String firstPart = nextUrl.split('offset=')[1];
    final String secondPart = firstPart.split('&limit')[0];
    final int next = int.parse(secondPart);
    return next;
  }
}
