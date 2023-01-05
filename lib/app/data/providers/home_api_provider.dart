import 'package:pokedex/app/data/network/dio_client.dart';
import 'package:pokedex/app/data/network/endpoints.dart';
import 'package:pokedex/app/models/all_pokemons_model.dart';
import 'package:pokedex/app/models/description_model.dart';
import 'package:pokedex/app/models/search_pokemon_for_name_model.dart';

class HomeApiProvider {
  final DioClient _dioClient;

  HomeApiProvider(this._dioClient);
  int _offset = 0;
  Future<AllPokemonsModel> getAllPokemons() async {
    try {
      var response = await _dioClient.get<Map<String, dynamic>>(
          "${Endpoints.baseUrl}pokemon/?offset=${_offset.toString()}&limit=20");

      _offset += 20;
      return AllPokemonsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SearchPokemonForNameModel>> getAllPokemonsStatus(
      int offset) async {
    List<SearchPokemonForNameModel> pokemons = [];
    try {
      var response = await _dioClient.get<Map<String, dynamic>>(
          "${Endpoints.baseUrl}pokemon/?offset=0&limit=50");

      List listPokemons = response['results'];

      for (int i = 0; i < listPokemons.length; i++) {
        SearchPokemonForNameModel? pokemon =
            await _loadingPokemon(listPokemons[i]['url']);

        pokemons.add(pokemon!);
      }
      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<AllPokemonsModel> getMorePokemons(String next) async {
    try {
      final response = await _dioClient.get<Map<String, dynamic>>(next);

      return AllPokemonsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DescriptionModel> getPokemonDescription(String id) async {
    try {
      final response = await _dioClient
          .get<Map<String, dynamic>>("${Endpoints.baseUrl}pokemon-species/$id");

      return DescriptionModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<SearchPokemonForNameModel?> _loadingPokemon(String urlPokemon) async {
    try {
      var response = await _dioClient.get(urlPokemon);

      var pokemonResponse = response;

      SearchPokemonForNameModel pokemon =
          SearchPokemonForNameModel.fromJson(pokemonResponse);

      return pokemon;
    } catch (erro) {
      return null;
    }
  }
}
