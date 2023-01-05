import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:mix/mix.dart';
import 'package:pokedex/app/core/assets.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';
import 'package:pokedex/app/core/utils/app_size.dart';
import 'package:pokedex/app/modules/home/widgets/type_card.dart';
import 'package:pokedex/app/modules/pokemon_details/controllers/pokemon_details_controller.dart';
import 'package:pokedex/app/modules/pokemon_details/widgets/status_bar.dart';
import 'package:pokedex/app/widgets/back_button.dart';
import 'package:pokedex/app/widgets/bottom_navigation_bar_app.dart';
import 'package:pokedex/app/widgets/loading.dart';

class PokemonDetailsView extends GetView<PokemonDetailsController> {
  const PokemonDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Loading(
        show: controller.loading,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:
                ThemeAPP.colors.cardsTone.cardSearchTone.withOpacity(0.10),
            leading: const BackButtonApp(),
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
          body: SafeArea(
            child: _buildBody(context),
          ),
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
                _buildTitle(),
                _buildDescription(),
                _buildBodyDescription(),
                SizedBox(
                  height: AppSize().getHeight(28),
                ),
                _buildStatusBar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardApresentation(BuildContext context) {
    return Container(
      height: AppSize().getHeight(260),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ThemeAPP.colors.cardsTone.cardSearchTone.withOpacity(0.10),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Center(
        child: Image.network(
          controller.image!,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            VBox(
              children: [
                Text(
                  controller.pokemonName![0].toUpperCase() +
                      controller.pokemonName!.substring(1),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: ThemeAPP.colors.primaryText,
                  ),
                ),
                Text(
                  "Cod: #00${controller.id!}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ThemeAPP.colors.primaryText),
                ),
              ],
            ),
            VBox(
              children: [
                const HBox(
                  children: [
                    Icon(Icons.favorite_outline),
                    Icon(Icons.share_outlined),
                  ],
                ),
                SizedBox(
                  height: AppSize().getHeight(8),
                ),
                TypeCard(
                    text: controller.type![0].toUpperCase() +
                        controller.type!.substring(1),
                    color: _color),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color get _color {
    switch (controller.type) {
      case "fire":
        return ThemeAPP.colors.cardsTone.cardFireTone;
      case "air":
        return ThemeAPP.colors.cardsTone.cardAirTone;
      case "normal":
        return ThemeAPP.colors.cardsTone.cardNormalTone;
      case "grass":
        return ThemeAPP.colors.cardsTone.cardEarthTone;
      case "water":
        return ThemeAPP.colors.primaryText;
      case "bug":
        return ThemeAPP.colors.cardsTone.cardRockTone;
      case "poison":
        return ThemeAPP.colors.cardsTone.cardDefTone;
      case "electric":
        return ThemeAPP.colors.cardsTone.cardEletricTone;
      default:
        return ThemeAPP.colors.secundaryText;
    }
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: VBox(
          children: [
            Text(
              "Descrição",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ThemeAPP.colors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyDescription() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Box(
          child: Text(
            controller.description!,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ThemeAPP.colors.primaryText,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar(BuildContext context) {
    return VBox(
      children: [
        _buildHPStatusBar(context),
        SizedBox(
          height: AppSize().getHeight(18),
        ),
        _buildDefStatusBar(context),
        SizedBox(
          height: AppSize().getHeight(18),
        ),
        _buildAtackStatusBar(context),
      ],
    );
  }

  Widget _buildHPStatusBar(BuildContext context) {
    return StatusBar(
      text: "Vida",
      color: ThemeAPP.colors.cardsTone.cardHPTone,
      percent: controller.life!,
      width: MediaQuery.of(context).size.width * 0.21,
    );
  }

  Widget _buildDefStatusBar(BuildContext context) {
    return StatusBar(
      text: "Defesa",
      color: ThemeAPP.colors.cardsTone.cardDefTone,
      percent: controller.defense!,
      width: MediaQuery.of(context).size.width * 0.175,
    );
  }

  Widget _buildAtackStatusBar(BuildContext context) {
    return StatusBar(
      text: "Ataque",
      color: ThemeAPP.colors.cardsTone.cardAtckTone,
      percent: controller.atack!,
      width: MediaQuery.of(context).size.width * 0.175,
    );
  }
}
