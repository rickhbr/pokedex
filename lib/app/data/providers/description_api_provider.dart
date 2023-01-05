import 'package:pokedex/app/data/network/dio_client.dart';
import 'package:pokedex/app/data/network/endpoints.dart';
import 'package:pokedex/app/models/description_model.dart';

class DescriptionApiProvider {
  final DioClient _dioClient;

  DescriptionApiProvider(this._dioClient);

  Future<DescriptionModel> getPokemonDescription(String id) async {
    try {
      final response = await _dioClient
          .get<Map<String, dynamic>>("${Endpoints.baseUrl}pokemon-species/$id");

      return DescriptionModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
