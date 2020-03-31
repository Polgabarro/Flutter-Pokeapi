import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/generated/i18n.dart';
import 'package:pokedex/models/pokemon_simple_model.dart';
import 'package:pokedex/pages/containers/detail/detail_page.dart';
import 'package:pokedex/pages/containers/list/bloc/bloc.dart';
import 'package:pokedex/pages/widgets/pokemon_item.dart';
import 'package:pokedex/repositories/poke_api_repository.dart';
import "package:pokedex/utils/extensions.dart";

class PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PokemonListBloc(PokeApiRepository())..add(GetPokemonsList()),
      child: PokemonListContent(),
    );
  }
}

class PokemonListContent extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonListContent> {
  final _scrollController = ScrollController();

  final _scrollThreshold = 200.0;

  PokemonListBloc _pokemonListBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _pokemonListBloc = context.bloc<PokemonListBloc>();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset('res/images/pokeball.png',
              width: 10, height: 10, fit: BoxFit.cover),
        ),
        centerTitle: false,
        title: Text(S.of(context).title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          )
        ],
      ),
      body: BlocListener<PokemonListBloc, ListBlocState>(
        listener: (context, state) {
          if (state is PokemonListError) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<PokemonListBloc, ListBlocState>(
          builder: (context, state) {
            if (state is InitialPokemonList) {
              return buildLoading();
            } else if (state is PokemonListLoaded) {
              return buildPokemonList(state.pokemons, state.next != null);
            } else if (state is PokemonListLoadingMore) {
              return buildPokemonList(state.pokemons, true);
            } else if (state is PokemonListError) {
              return Text(state.message);
            }
            return buildLoading();
          },
        ),
      ),
    );
  }

  CustomScrollView buildPokemonList(
      List<PokemonSimpleModel> pokemonList, bool loading) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverFixedExtentList(
          itemExtent: 57.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            if (index < pokemonList.length) {
              return PokemonItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetail(pokemonName: pokemonList[index].name, id: (index + 1))
                      )
                    );
                  },
                  imageUrl:
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
                  pokemonName: pokemonList[index].name.capitalize());
            } else {
              return buildLoading();
            }
          }, childCount: pokemonList.length + (loading ? 1 : 0)),
        )
      ],
    );
  }

  Center buildLoading() => Center(child: CircularProgressIndicator());

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      if (_pokemonListBloc.state is PokemonListLoaded) {
        _pokemonListBloc.add(GetPokemonsList());
      }
    }
  }
}
