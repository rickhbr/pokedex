import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:mix/mix.dart';
import 'package:pokedex/app/core/assets.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';
import 'package:pokedex/app/core/utils/app_size.dart';
import 'package:pokedex/app/modules/home/controllers/home_controller.dart';
import 'package:pokedex/app/modules/home/widgets/button_search.dart';
import 'package:pokedex/app/modules/home/widgets/pokemon_card.dart';
import 'package:pokedex/app/modules/home/widgets/pokemon_card_home.dart';
import 'package:pokedex/app/modules/home/widgets/search_not_found.dart';
import 'package:pokedex/app/modules/home/widgets/type_cards_list.dart';
import 'package:pokedex/app/routes/app_pages.dart';
import 'package:pokedex/app/widgets/bottom_navigation_bar_app.dart';
import 'package:pokedex/app/widgets/loading.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Loading(
        show: controller.loading,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.menu,
              color: ThemeAPP.colors.primaryText,
            ),
            shadowColor: Colors.transparent,
            actions: [
              Image.asset(
                Assets.profile,
              ),
            ],
            centerTitle: true,
            title: Image.asset(
              Assets.icInicie,
            ),
          ),
          body: _buildBody(context),
          bottomNavigationBar: const BottomNavigationBarApp(),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Box(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: ThemeAPP.colors.primaryBackground,
            child: VBox(
              children: [
                _buildCardApresentation(context),
                SizedBox(
                  height: AppSize().getHeight(20),
                ),
                controller.pokemonName.text.isNotEmpty
                    ? _buildBodySearch()
                    : _buildBodyPokemons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardApresentation(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.25,
      width: width * 0.9,
      decoration: BoxDecoration(
        color: ThemeAPP.colors.cardsTone.cardSearchTone.withOpacity(0.10),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Text(
              "Pokedéx",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ThemeAPP.colors.primaryText,
              ),
            ),
            Positioned(
              top: height * 0.06,
              child: Text(
                "Todas as espécies de pokemons\n estão esperando por você!",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ThemeAPP.colors.primaryText,
                ),
              ),
            ),
            Positioned(
              right: width * 0.10,
              top: height * 0.07,
              child: Image.asset(
                Assets.pikachu,
              ),
            ),
            Positioned(
              right: width * 0.12,
              bottom: height * 0.032,
              child: Image.asset(
                Assets.shadowPikachu,
              ),
            ),
            Positioned(
              top: width * 0,
              right: height * 0,
              child: Image.asset(
                Assets.rectangle,
              ),
            ),
            Positioned(
              bottom: height * 0.02,
              child: _buildSearch(context),
            ),
            Positioned(
              bottom: height * 0.021,
              right: width * 0.45,
              child: ButtonSearch(
                onTap: () {
                  controller.fetchPokemonData(
                      name: controller.pokemonName.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearch(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeAPP.colors.secundaryText,
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 2),
            )
          ]),
      width: MediaQuery.of(context).size.width * 0.30,
      height: MediaQuery.of(context).size.height * 0.05,
      child: TextField(
        onChanged: ((value) {
          controller.debouncerText.run(() {
            controller.onRefresh(args: controller.pokemonName.text);
          });
        }),
        controller: controller.pokemonName,
        cursorColor: ThemeAPP.colors.secundaryText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildBodySearch() {
    return controller.listPokemonsSearch == null ||
            controller.pokemonName.text.isEmpty
        ? _buildSearchError()
        : _buildResultSearch();
  }

  Widget _buildSearchError() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: VBox(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Resultado da busca",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ThemeAPP.colors.primaryText,
              ),
            ),
          ),
          SizedBox(
            height: AppSize().getHeight(12),
          ),
          controller.loading == true ? Container() : const SearchNotFound(),
        ],
      ),
    );
  }

  Widget _buildResultSearch() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: VBox(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Resultado da busca",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ThemeAPP.colors.primaryText,
              ),
            ),
          ),
          SizedBox(
            height: AppSize().getHeight(12),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: PokemonCard(
              name: controller.listPokemonsSearch!.name!,
              type: controller.listPokemonsSearch!.types[0].type!.name!,
              code: controller.listPokemonsSearch!.id.toString(),
              image: controller.listPokemonsSearch!.sprites!.frontDefault!,
              onPressed: () async {
                // await for wait response for api
                await controller.fetchPokemonDescription(
                    id: controller.listPokemonsSearch!.id.toString());
                // only navigate after list for description is != null
                if (controller.listPokemonsDescription != null) {
                  Get.toNamed(
                    Routes.details,
                    arguments: HomeArguments(
                      id: controller.listPokemonsSearch!.id.toString(),
                      image:
                          controller.listPokemonsSearch!.sprites!.frontDefault!,
                      pokemonName: controller.listPokemonsSearch!.name!,
                      type: controller.listPokemonsSearch!.types[0].type!.name!,
                      // the description of the api are so bigger, so let me spli on 3 parts
                      description:
                          "\"${controller.listPokemonsDescription!.flavorTextEntries[0].flavorText!} ${controller.listPokemonsDescription!.flavorTextEntries[1].flavorText!} ${controller.listPokemonsDescription!.flavorTextEntries[2].flavorText!}\""
                              .replaceAll("\n", " "),
                      life: controller.listPokemonsSearch!.stats[0].baseStat!
                          .toDouble(),
                      defense: controller.listPokemonsSearch!.stats[2].baseStat!
                          .toDouble(),
                      atack: controller.listPokemonsSearch!.stats[1].baseStat!
                          .toDouble(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyPokemons() {
    return VBox(
      children: [
        _buildType(),
        SizedBox(
          height: AppSize().getHeight(40),
        ),
        _buildMostSearch(),
      ],
    );
  }

  Widget _buildType() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
      ),
      child: VBox(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Tipo",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ThemeAPP.colors.primaryText,
              ),
            ),
          ),
          SizedBox(
            height: AppSize().getHeight(12),
          ),
          const TypeCardList(),
        ],
      ),
    );
  }

  Widget _buildMostSearch() {
    return VBox(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              "Mais procurados",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ThemeAPP.colors.primaryText,
              ),
            ),
          ),
        ),
        SizedBox(
          height: AppSize().getHeight(12),
        ),
        controller.listAllPokemonsResult != null
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 1.3),
                    itemCount: controller.listAllPokemonsStatus!.length,
                    itemBuilder: (context, index) {
                      return PokemonCardHome(
                        onPressed: () async {
                          // await for wait response for api
                          await controller.fetchPokemonDescription(
                              id: controller.listAllPokemonsStatus![index].id
                                  .toString());
                          // only navigate after list for description is != null
                          if (controller.listPokemonsDescription != null) {
                            Get.toNamed(
                              Routes.details,
                              arguments: HomeArguments(
                                id: controller.listAllPokemonsStatus![index].id
                                    .toString(),
                                image: controller.listAllPokemonsStatus![index]
                                    .sprites!.frontDefault!,
                                pokemonName: controller
                                    .listAllPokemonsStatus![index].name!,
                                type: controller.listAllPokemonsStatus![index]
                                    .types[0].type!.name!,
                                // the description of the api are so bigger, so let me spli on 3 parts
                                description:
                                    "\"${controller.listPokemonsDescription!.flavorTextEntries[0].flavorText!} ${controller.listPokemonsDescription!.flavorTextEntries[1].flavorText!} ${controller.listPokemonsDescription!.flavorTextEntries[2].flavorText!}\""
                                        .replaceAll("\n", " "),
                                life: controller.listAllPokemonsStatus![index]
                                    .stats[0].baseStat!
                                    .toDouble(),
                                defense: controller
                                    .listAllPokemonsStatus![index]
                                    .stats[2]
                                    .baseStat!
                                    .toDouble(),
                                atack: controller.listAllPokemonsStatus![index]
                                    .stats[1].baseStat!
                                    .toDouble(),
                              ),
                            );
                          }
                        },
                        name: controller.listAllPokemonsStatus![index].name!,
                        type: controller
                            .listAllPokemonsStatus![index].types[0].type!.name!,
                        code: controller.listAllPokemonsStatus![index].id
                            .toString(),
                        image: controller.listAllPokemonsStatus![index].sprites!
                            .frontDefault!,
                      );
                    }),
              )
            : Container(),
      ],
    );
  }
}
