import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:pokedex/app/core/utils/debounce.dart';
import 'package:pokedex/app/data/repositories/description_api_repository.dart';
import 'package:pokedex/app/data/repositories/home_api_repository.dart';
import 'package:pokedex/app/data/repositories/search_api_repository.dart';
import 'package:pokedex/app/models/all_pokemons_model.dart';
import 'package:pokedex/app/models/description_model.dart';
import 'package:pokedex/app/models/search_pokemon_for_name_model.dart';

// class of arguments for pokemon details screen
class HomeArguments {
  final String? image;
  final String? pokemonName;
  final String? description;
  final String? type;
  final String? id;
  final double? life;
  final double? defense;
  final double? atack;

  HomeArguments({
    this.image,
    this.pokemonName,
    this.description,
    this.id,
    this.type,
    this.life,
    this.defense,
    this.atack,
  });
}

class HomeController extends GetxController {
  final SearchApiRepository _searchApiRepository = Get.find();
  final DescriptionApiRepository _descriptionApiRepository = Get.find();
  final HomeApiRepository _homeApiRepository = Get.find();

  final RxBool _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  final Rxn<SearchPokemonForNameModel> _listPokemonsSearch = Rxn();
  SearchPokemonForNameModel? get listPokemonsSearch =>
      _listPokemonsSearch.value;
  set listPokemonsSearch(SearchPokemonForNameModel? value) =>
      _listPokemonsSearch.value = value;

  final Rxn<AllPokemonsModel> _listAllPokemons = Rxn();
  AllPokemonsModel? get listAllPokemons => _listAllPokemons.value;
  set listAllPokemons(AllPokemonsModel? value) =>
      _listAllPokemons.value = value;

  final Rxn<List<SearchPokemonForNameModel>> _listAllPokemonsStatus = Rxn();
  List<SearchPokemonForNameModel>? get listAllPokemonsStatus =>
      _listAllPokemonsStatus.value;
  set listAllPokemonsStatus(List<SearchPokemonForNameModel>? value) =>
      _listAllPokemonsStatus.value = value;

  final Rxn<SearchPokemonForNameModel> _listAllPokemonsResult = Rxn();
  SearchPokemonForNameModel? get listAllPokemonsResult =>
      _listAllPokemonsResult.value;
  set listAllPokemonsResult(SearchPokemonForNameModel? value) =>
      _listAllPokemonsResult.value = value;

  final Rxn<DescriptionModel> _listPokemonsDescription = Rxn();
  DescriptionModel? get listPokemonsDescription =>
      _listPokemonsDescription.value;
  set listPokemonsDescription(DescriptionModel? value) =>
      _listPokemonsDescription.value = value;

  RxInt limit = 0.obs;
  Debouncer debouncerText = Debouncer(milliseconds: 500);
  TextEditingController pokemonName = TextEditingController();

  @override
  void onInit() async {
    fetchAllPokemonsStatus();

    super.onInit();
  }

  void onRefresh({required String? args}) {
    // verify if search textformfield has empty, otherwise make the fetch and loading list
    if (args != null) {
      fetchPokemonData(name: args);
    }
    // if onchanged text on textformfield return null on the fetch, list receive null for loading not results found widget
    listPokemonsSearch = null;
  }

  // return of list for all pokemons results
  Future<void> fetchAllPokemons() async {
    try {
      loading = true;
      final AllPokemonsModel listPokemons =
          await _homeApiRepository.getAllPokemons();
      listAllPokemons = listPokemons;
      loading = true;
      final SearchPokemonForNameModel listPokemonsResponse =
          await _searchApiRepository
              .getPokemonForName(listAllPokemons!.results[1].name!);
      listAllPokemonsResult = listPokemonsResponse;
    } catch (e) {
      rethrow;
    } finally {
      loading = false;
    }
  }

  // fetch for take all status for pokemon (name, type, type, sprite, etc)
  Future<void> fetchAllPokemonsStatus() async {
    try {
      loading = true;
      final List<SearchPokemonForNameModel> listPokemonsStatus =
          await _homeApiRepository.getAllPokemonsStatus(limit.value);

      listAllPokemonsStatus = listPokemonsStatus;
    } catch (e) {
      rethrow;
    } finally {
      fetchAllPokemons();
      loading = false;
    }
  }

  // fetch for search bar, return 1 pokemon
  Future<void> fetchPokemonData({required String name}) async {
    try {
      loading = true;
      final SearchPokemonForNameModel pokemonsList =
          await _searchApiRepository.getPokemonForName(name);
      listPokemonsSearch = pokemonsList;

      if (listPokemonsSearch != null) {
        fetchPokemonDescription(id: listPokemonsSearch!.id.toString());
      }
    } catch (e) {
      rethrow;
    } finally {
      loading = false;
    }
  }

// fetch for return description for pokemon
  Future<void> fetchPokemonDescription({required String id}) async {
    try {
      loading = true;
      final DescriptionModel pokemonsListDescription =
          await _descriptionApiRepository.getPokemonDescription(id);
      listPokemonsDescription = pokemonsListDescription;
    } catch (e) {
      rethrow;
    } finally {
      loading = false;
    }
  }
}
