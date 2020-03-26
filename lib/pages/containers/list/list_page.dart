import 'package:flutter/material.dart';
import 'package:pokedex/generated/i18n.dart';
import 'package:pokedex/pages/widgets/pokemon_item.dart';

class PokemonList extends StatelessWidget {
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
        body: pokemonList());
  }

  CustomScrollView pokemonList() {
    return CustomScrollView(
      slivers: [
        SliverFixedExtentList(
          itemExtent: 72.0,
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            if (index < 100) {
              return PokemonItem();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }, childCount: 101),
        )
      ],
    );
  }
}
