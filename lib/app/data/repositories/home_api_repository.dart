import 'package:pokedex/app/data/providers/home_api_provider.dart';
import 'package:pokedex/app/models/all_pokemons_model.dart';
import 'package:pokedex/app/models/search_pokemon_for_name_model.dart';

class HomeApiRepository {
  final HomeApiProvider _homeApiProvider;

  HomeApiRepository(this._homeApiProvider);

  Future<AllPokemonsModel> getAllPokemons() async {
    return _homeApiProvider.getAllPokemons();
  }

  Future<List<SearchPokemonForNameModel>> getAllPokemonsStatus(
      int offset) async {
    return _homeApiProvider.getAllPokemonsStatus(offset);
  }

  Future<AllPokemonsModel> getMorePokemons(String next) async {
    return _homeApiProvider.getMorePokemons(next);
  }
}
