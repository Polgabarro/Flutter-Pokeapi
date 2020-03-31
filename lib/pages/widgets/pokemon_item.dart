import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonItem extends StatelessWidget {

  final String imageUrl;
  final String pokemonName;
  final void Function() onTap;

  const PokemonItem({
    Key key,
    @required this.imageUrl,
    @required this.pokemonName,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: onTap,
          leading: Hero(
            tag: imageUrl,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('res/images/pokeball.png'),
              ),
            ),
          ),
          title: Text(pokemonName),
        ),
        const Divider(
          height: 1,
        )
      ],
    );
  }
}