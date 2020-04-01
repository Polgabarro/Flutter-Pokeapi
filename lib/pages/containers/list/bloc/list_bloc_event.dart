import 'package:equatable/equatable.dart';
import 'package:pokedex/models/pokemon_types_model.dart';

abstract class ListBlocEvent extends Equatable {
  const ListBlocEvent();
}

class GetPokemonsList extends ListBlocEvent {

  int nextItem;
  bool reset;

  GetPokemonsList({this.nextItem = 0, this.reset = false});

  @override
  List<Object> get props => [nextItem];
}

class GetPokemonsByType extends ListBlocEvent {

  PokeType type;

  GetPokemonsByType({this.type});

  @override
  List<Object> get props => [type];
}
