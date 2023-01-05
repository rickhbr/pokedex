import "package:get/get.dart";
import 'package:pokedex/app/modules/home/bindings/home_binding.dart';
import 'package:pokedex/app/modules/home/views/home_view.dart';
import 'package:pokedex/app/modules/pokemon_details/bindings/pokemon_details_binding.dart';
import 'package:pokedex/app/modules/pokemon_details/views/pokemon_details_view.dart';
import 'package:pokedex/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:pokedex/app/modules/welcome/views/welcome_view.dart';

part "app_routes.dart";

class AppPages {
  AppPages._();

  static final routes = [
    // Welcome page
    GetPage(
      name: _Paths.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    // Home page
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // Details page
    GetPage(
      name: _Paths.details,
      page: () => const PokemonDetailsView(),
      binding: PokemonDetailsBinding(),
    ),
  ];
}
