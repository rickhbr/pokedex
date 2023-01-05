import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';
import 'package:pokedex/app/core/utils/app_size.dart';

class SearchNotFound extends StatefulWidget {
  const SearchNotFound({super.key});

  @override
  State<SearchNotFound> createState() => _SearchNotFoundState();
}

class _SearchNotFoundState extends State<SearchNotFound> {
  @override
  Widget build(BuildContext context) {
    return VBox(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Nenhum resultado encontrado! :(",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ThemeAPP.colors.primaryText,
            ),
          ),
        ),
        SizedBox(
          height: AppSize().getHeight(12),
        ),
        Icon(
          Icons.search_off,
          size: 60,
          color: ThemeAPP.colors.secundaryText,
        ),
      ],
    );
  }
}
