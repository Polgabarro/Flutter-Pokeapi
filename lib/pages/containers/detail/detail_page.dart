import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/pages/containers/detail/bloc/bloc.dart';
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
                  );
                } else if (state is LoadedPokemonDetailState) {
                  return PokemonCard(state.pokemon);
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

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemonModel;

  const PokemonCard(
    this.pokemonModel, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: pokemonModel.sprites.frontDefault,
            child: CachedNetworkImage(
              imageUrl: pokemonModel.sprites.frontDefault,
              width: MediaQuery.of(context).size.width / 2.25,
              fit: BoxFit.fill,
            ),
          ),
          CachedNetworkImage(
            imageUrl: pokemonModel.sprites.backDefault,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width / 2.25,
          )
        ],
      ),
    );
  }
}
