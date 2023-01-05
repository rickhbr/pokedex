import 'package:pokedex/app/data/network/dio_client.dart';
import 'package:pokedex/app/data/network/endpoints.dart';
import 'package:pokedex/app/models/search_pokemon_for_name_model.dart';

class SearchApiProvider {
  final DioClient _dioClient;

  SearchApiProvider(this._dioClient);

  Future<SearchPokemonForNameModel> getPokemonForName(String name) async {
    try {
      final response = await _dioClient
          .get<Map<String, dynamic>>("${Endpoints.baseUrl}pokemon/$name");

      return SearchPokemonForNameModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
