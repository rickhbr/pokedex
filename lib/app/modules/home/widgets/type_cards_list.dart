import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';
import 'package:pokedex/app/modules/home/widgets/type_card.dart';

class TypeCardList extends StatelessWidget {
  const TypeCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return HBox(
      children: [
        TypeCard(
          text: "Fogo",
          color: ThemeAPP.colors.cardsTone.cardFireTone,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        TypeCard(
          text: "Normal",
          color: ThemeAPP.colors.cardsTone.cardNormalTone,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        TypeCard(
          text: "Ar",
          color: ThemeAPP.colors.cardsTone.cardAirTone,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        TypeCard(
          text: "Terra",
          color: ThemeAPP.colors.cardsTone.cardEarthTone,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.01,
        ),
        TypeCard(
          text: "Pedra",
          color: ThemeAPP.colors.cardsTone.cardRockTone,
        ),
      ],
    );
  }
}
