import 'package:equatable/equatable.dart';

abstract class ListBlocEvent extends Equatable {
  const ListBlocEvent();
}

class GetPokemonsList extends ListBlocEvent {

  int nextItem;

  GetPokemonsList({this.nextItem = 0});

  @override
  List<Object> get props => [nextItem];
}
