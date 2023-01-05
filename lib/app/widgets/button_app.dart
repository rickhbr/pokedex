import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/core/assets.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';
import 'package:pokedex/app/core/utils/app_size.dart';
import 'package:pokedex/app/routes/app_pages.dart';

class ButtonApp extends StatefulWidget {
  final String text;
  const ButtonApp({super.key, required this.text});

  @override
  State<ButtonApp> createState() => _ButtonAppState();
}

class _ButtonAppState extends State<ButtonApp> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(
              Routes.home,
            );
          },
          child: Container(
            height: AppSize().getHeight(43),
            width: MediaQuery.of(context).size.width * 0.58,
            decoration: BoxDecoration(
              color: ThemeAPP.colors.secundaryText,
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: ThemeAPP.colors.secundaryText,
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: width * 0.05,
          bottom: 0,
          top: 0,
          child: Image.asset(
            Assets.arrow,
            width: 10,
            height: AppSize().getHeight(18),
          ),
        ),
      ],
    );
  }
}
