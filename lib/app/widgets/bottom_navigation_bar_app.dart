import 'package:flutter/material.dart';
import 'package:pokedex/app/core/theme/theme_app.dart';

class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 32,
      unselectedItemColor: Colors.grey,
      selectedItemColor: ThemeAPP.colors.primaryText,
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Favoritos",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          label: "Minha conta",
        ),
      ],
    );
  }
}
