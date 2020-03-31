import 'package:equatable/equatable.dart';

abstract class PokemonDetailEvent extends Equatable {
  const PokemonDetailEvent();
}

class GetPokemonEvent extends PokemonDetailEvent {

  final String pokemonName;

  GetPokemonEvent(this.pokemonName);

  @override
  List<Object> get props => null;
}

