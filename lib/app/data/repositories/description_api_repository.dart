import 'package:pokedex/app/data/providers/description_api_provider.dart';
import 'package:pokedex/app/models/description_model.dart';

class DescriptionApiRepository {
  final DescriptionApiProvider _descriptionApiProvider;

  DescriptionApiRepository(this._descriptionApiProvider);

  Future<DescriptionModel> getPokemonDescription(String id) async {
    return _descriptionApiProvider.getPokemonDescription(id);
  }
}
