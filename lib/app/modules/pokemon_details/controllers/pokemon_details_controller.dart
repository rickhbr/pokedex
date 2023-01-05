import 'package:get/get.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';

class PokemonDetailsController extends GetxController {
  final RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  String? image;
  String? pokemonName;
  String? description;
  String? type;
  String? id;
  double? life;
  double? defense;
  double? atack;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is HomeArguments) {
      final args = Get.arguments as HomeArguments;
      image = args.image;
      pokemonName = args.pokemonName;
      description = args.description;
      type = args.type;
      id = args.id;
      life = args.life;
      defense = args.defense;
      atack = args.atack;
    } else {
      Get.back();
    }
  }
}
