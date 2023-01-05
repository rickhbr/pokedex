import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:mix/mix.dart';
import 'package:pokedex/app/core/assets.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';
import 'package:pokedex/app/core/utils/app_size.dart';
import 'package:pokedex/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:pokedex/app/widgets/button_app.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Box(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: ThemeAPP.colors.primaryBackground,
          child: VBox(
            children: [
              SizedBox(
                height: AppSize().getHeight(50),
              ),
              _buildImage(context),
              _buildTitle(),
              SizedBox(
                height: AppSize().getHeight(10),
              ),
              _buildSubtitle(),
              SizedBox(
                height: AppSize().getHeight(20),
              ),
              _buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Box(
          child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(children: <TextSpan>[
          TextSpan(
            text: "Explore o mundo dos ",
            style: TextStyle(
              color: ThemeAPP.colors.primaryText,
              fontWeight: FontWeight.w700,
              fontSize: 35,
            ),
          ),
          TextSpan(
            text: "Pokémons",
            style: TextStyle(
              color: ThemeAPP.colors.secundaryText,
              fontWeight: FontWeight.w700,
              fontSize: 35,
            ),
          ),
        ]),
      )),
    );
  }

  Widget _buildImage(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.8,
      child: Stack(
        children: [
          Image.asset(Assets.icPokemon),
          Positioned(
            top: height * -0.05,
            left: width * 0.1,
            child: Image.asset(Assets.icInicie),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return Box(
      child: Text(
        "Descubra todas as espécies de Pokémons",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ThemeAPP.colors.primaryText,
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return const ButtonApp(
      text: "Começar",
    );
  }
}
