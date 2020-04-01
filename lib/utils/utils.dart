

int getIdByPokemonUrl(String url) {
  return int.parse(url.split('pokemon/')[1].split('/')[0]);
}