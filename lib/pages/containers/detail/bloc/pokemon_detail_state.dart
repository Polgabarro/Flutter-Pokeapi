import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_model.dart';

abstract class PokemonDetailState extends Equatable {
  const PokemonDetailState();
}

class InitialPokemonDetailState extends PokemonDetailState {
  @override
  List<Object> get props => [];
}

class LoadingPokemonDetailState extends PokemonDetailState {
  @override
  List<Object> get props => [];
}

class LoadedPokemonDetailState extends PokemonDetailState {

  final PokemonModel pokemon;

  LoadedPokemonDetailState(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

class ErrorPokemonDetailState extends PokemonDetailState {
  @override
  List<Object> get props => [];
}
