import "package:get/get.dart";
import 'package:pokedex/app/modules/pokemon_details/controllers/pokemon_details_controller.dart';

class PokemonDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonDetailsController>(
      () => PokemonDetailsController(),
    );
  }
}
