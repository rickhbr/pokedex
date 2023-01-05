import 'package:flutter/material.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';
import 'package:pokedex/app/core/utils/app_size.dart';

class ButtonSearch extends StatefulWidget {
  final void Function()? onTap;
  const ButtonSearch({super.key, required this.onTap});

  @override
  State<ButtonSearch> createState() => _ButtonSearchState();
}

class _ButtonSearchState extends State<ButtonSearch> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            widget.onTap;
          },
          child: Container(
            height: AppSize().getHeight(38),
            width: MediaQuery.of(context).size.width * 0.13,
            decoration: BoxDecoration(
              color: ThemeAPP.colors.secundaryText,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(5.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: ThemeAPP.colors.secundaryText,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
