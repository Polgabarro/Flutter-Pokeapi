import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import "package:pokedex/utils/extensions.dart";
import 'package:skeleton_text/skeleton_text.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemonModel;
  final bool loading;

  const PokemonCard(
    this.pokemonModel, {
      this.loading = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Hero(
                    tag: pokemonModel.sprites.frontDefault,
                    child: CachedNetworkImage(
                      imageUrl: pokemonModel.sprites.frontDefault,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CachedNetworkImage(
                    imageUrl: pokemonModel.sprites.backDefault,
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: Text((pokemonModel?.species?.name ?? ' ').capitalize()),
            subtitle: Text((pokemonModel?.species?.name ?? ' ').capitalize()),
          ),
          Divider(),
          !loading ? ListTile(
            leading: Icon(
              Icons.line_weight,
            ),
            title: Text('${(pokemonModel?.weight)} kg')
          ) : buildItemSkeleton(),
          !loading ? ListTile(
            leading: Icon(
              Icons.sd_storage,
            ),
            title: Text('${(pokemonModel?.weight ?? ' ')} kg'),
          ) : buildItemSkeleton()
        ],
      ),
    );
  }

  Padding buildItemSkeleton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SkeletonAnimation(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey[300]
                  ),
                )
            ),
    );
  }
}
