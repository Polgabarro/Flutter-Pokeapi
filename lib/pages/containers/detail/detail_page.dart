import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/containers/detail/bloc/bloc.dart';
import 'package:pokedex/pages/widgets/pokemon_card.dart';
import 'package:pokedex/repositories/poke_api_repository.dart';

import 'bloc/pokemon_detail_bloc.dart';
import 'bloc/pokemon_detail_event.dart';
import "package:pokedex/utils/extensions.dart";

class PokemonDetail extends StatelessWidget {
  static const routeName = '/detail';
  final String pokemonName;
  final int id;

  const PokemonDetail({Key key, this.pokemonName, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonDetailBloc(PokeApiRepository())
        ..add(GetPokemonEvent(pokemonName)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(pokemonName.capitalize()),
        ),
        body: Column(
          children: <Widget>[
            BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
              builder: (context, state) {
                print(state);
                if (state is InitialPokemonDetailState ||
                    state is LoadingPokemonDetailState) {
                  return PokemonCard(
                    PokemonModel(
                      Sprites(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/$id.png',
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png'),
                    ),
                    loading: true,
                  );
                } else if (state is LoadedPokemonDetailState) {
                  return PokemonCard(
                    state.pokemon,
                    loading: false,
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
