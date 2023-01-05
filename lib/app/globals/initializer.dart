import "dart:async";

import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:pokedex/app/data/network/dio_client.dart';
import 'package:pokedex/app/data/providers/description_api_provider.dart';
import 'package:pokedex/app/data/providers/home_api_provider.dart';
import 'package:pokedex/app/data/providers/search_api_provider.dart';
import 'package:pokedex/app/data/repositories/description_api_repository.dart';
import 'package:pokedex/app/data/repositories/home_api_repository.dart';
import 'package:pokedex/app/data/repositories/search_api_repository.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';
import 'package:pokedex/app/modules/pokemon_details/controllers/pokemon_details_controller.dart';
import 'package:pokedex/app/modules/welcome/controllers/welcome_controller.dart';

class Initializer {
  static final Initializer instance = Initializer._internal();
  factory Initializer() => instance;
  Initializer._internal();

  StreamController<bool> loadedAppController = StreamController.broadcast();

  void init(VoidCallback runApp) {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        throw details;
      };

      _initServices().then((value) async {
        // run app before stream send ack
        runApp();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          // wait app to render completely
          // load app complete
          loadedAppController.add(true);
        });
      });
    }, (error, stack) {});
  }

  Future<void> _initServices() async {
    try {
      _initControllers();
      _initApis();
      _initSingletons();
      _initRepositories();
    } catch (err) {
      rethrow;
    }
  }

  // init singletons
  void _initSingletons() {
    Get.lazyPut(() => DioClient(Get.find<Dio>()));
    Get.put(Dio());
  }

  // init controllers
  void _initControllers() {
    Get.lazyPut(() => WelcomeController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => PokemonDetailsController(), fenix: true);
  }

  // init APIs
  void _initApis() {
    Get.lazyPut(() => SearchApiProvider(Get.find<DioClient>()), fenix: true);
    Get.lazyPut(() => HomeApiProvider(Get.find<DioClient>()), fenix: true);
    Get.lazyPut(() => DescriptionApiProvider(Get.find<DioClient>()),
        fenix: true);
  }

  // init repositories
  void _initRepositories() {
    Get.lazyPut(() => SearchApiRepository(Get.find<SearchApiProvider>()),
        fenix: true);
    Get.lazyPut(() => HomeApiRepository(Get.find<HomeApiProvider>()),
        fenix: true);
    Get.lazyPut(
        () => DescriptionApiRepository(Get.find<DescriptionApiProvider>()),
        fenix: true);
  }
}
