import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/assets.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';

class BackButtonApp extends StatefulWidget {
  const BackButtonApp({super.key});

  @override
  State<BackButtonApp> createState() => _BackButtonAppState();
}

class _BackButtonAppState extends State<BackButtonApp> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Image.asset(
        Assets.icBack,
        color: ThemeAPP.colors.primaryText,
      ),
    );
  }
}
