import 'package:flutter/material.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png'),
          title: Text('Bulbasur'),
        ),
        Divider()
      ],
    );
  }
}