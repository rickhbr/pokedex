import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/app/globals/initializer.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const PokedexAPP());
  });
}
