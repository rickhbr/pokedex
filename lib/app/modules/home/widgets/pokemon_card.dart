import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pokedex/app/core/assets.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';
import 'package:pokedex/app/core/utils/app_size.dart';
import 'package:pokedex/app/core/utils/debounce.dart';
import 'package:pokedex/app/modules/home/widgets/type_card.dart';

class PokemonCard extends StatefulWidget {
  final String name;
  final String type;
  final String code;
  final String image;
  final void Function()? onPressed;
  final dynamic arguments;
  const PokemonCard({
    super.key,
    required this.name,
    required this.type,
    required this.code,
    this.onPressed,
    required this.image,
    this.arguments,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  Debouncer debouncerText = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: widget.onPressed,
      child: _buildBody(),
    );
  }

  MixableWidget _buildBody() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final style = Mix(px(8), py(12));
    return Box(
      child: Container(
        width: 160,
        height: 110,
        decoration: BoxDecoration(
          color: ThemeAPP.colors.primaryBackground,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 1,
              blurRadius: 12,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              VBox(
                mix: style,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.name[0].toUpperCase() + widget.name.substring(1),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ThemeAPP.colors.primaryText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize().getHeight(4),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TypeCard(
                      text: widget.type[0].toUpperCase() +
                          widget.type.substring(1),
                      color: _color,
                    ),
                  ),
                  SizedBox(
                    height: AppSize().getHeight(5),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "#${widget.code}",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ThemeAPP.colors.primaryText,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: width * 0,
                top: height * 0.015,
                child: Image.asset(
                  Assets.shadowRec,
                ),
              ),
              Positioned(
                right: width * 0.010,
                top: height * 0.005,
                child: Image.network(
                  widget.image,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color get _color {
    switch (widget.type) {
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
}
