import 'package:pokedex/app/data/providers/search_api_provider.dart';
import 'package:pokedex/app/models/search_pokemon_for_name_model.dart';

class SearchApiRepository {
  final SearchApiProvider _searchApiProvider;

  SearchApiRepository(this._searchApiProvider);

  Future<SearchPokemonForNameModel> getPokemonForName(String name) async {
    return _searchApiProvider.getPokemonForName(name);
  }
}
