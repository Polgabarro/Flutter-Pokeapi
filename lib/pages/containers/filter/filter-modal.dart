import 'package:flutter/material.dart';
import 'package:pokedex/generated/i18n.dart';
import 'package:pokedex/models/pokemon_types_model.dart';
import 'package:pokedex/repositories/poke_api_repository.dart';
import "package:pokedex/utils/extensions.dart";



class FilterModal extends StatefulWidget {

  final PokeType selectedType;

  FilterModal({this.selectedType});

  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {

  Future<PokemonTypesResponse>response = PokeApiRepository().getPokemonTypes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).seleciona_el_tipo),
      ),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context, AsyncSnapshot<PokemonTypesResponse> snapshot) {
          if(snapshot.hasData) {
            return ListView(
              children: snapshot.data.results.map((type) => ListTile(
                onTap: (){
                  Navigator.pop(context, type);
                },
                title: Text(type.name.capitalize(),
                style: TextStyle(color: type.name == widget.selectedType?.name ? Colors.blue : Colors.black)),
              )).toList()
              ,
            );
          } else if(snapshot.hasError) {
            return Text(snapshot.error);
          }else {
            return buildLoading();
          }
        },
      ),
    );
  }

  Center buildLoading() => Center(child: CircularProgressIndicator());

}
