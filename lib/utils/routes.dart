import 'package:flutter/material.dart';
import 'package:pokedex/pages/containers/list/list_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => PokemonList(),
};