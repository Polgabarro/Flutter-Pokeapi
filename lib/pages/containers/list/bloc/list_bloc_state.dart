import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_simple_model.dart';

abstract class ListBlocState extends Equatable {
  const ListBlocState();
}

class InitialPokemonList extends ListBlocState {
  final int next;
  const InitialPokemonList(this.next);

  @override
  List<Object> get props => [next];
}

class PokemonListLoadingMore extends ListBlocState {
  final List<PokemonSimpleModel> pokemons;
  final int next;

  const PokemonListLoadingMore(this.pokemons, this.next);

  @override
  List<Object> get props => [pokemons];
}

class PokemonListLoaded extends ListBlocState {
  final List<PokemonSimpleModel> pokemons;
  final int next;

  PokemonListLoaded(this.pokemons, this.next);

  @override
  List<Object> get props => [pokemons, this.next];
}

class PokemonListError extends ListBlocState {
  final String message;

  PokemonListError(this.message);

  @override
  List<Object> get props => [message];

}
