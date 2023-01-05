import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import 'package:pokedex/app/core/theme/theme_data.dart';
import 'package:pokedex/app/globals/initializer.dart';
import 'package:pokedex/app/routes/app_pages.dart';

class PokedexAPP extends StatefulWidget {
  const PokedexAPP({super.key});

  @override
  State<PokedexAPP> createState() => _PokedexAPPState();
}

class _PokedexAPPState extends State<PokedexAPP> with WidgetsBindingObserver {
  bool loadedApp = false;
  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    WidgetsBinding.instance.addObserver(this);
    Initializer.instance.loadedAppController.stream.listen((event) {
      setState(() {
        loadedApp = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: _scaffoldKey,
      title: "Pokedéx",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.welcome,
      locale: const Locale("pt", "BR"),
      getPages: AppPages.routes,
      theme: createTheme(context),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
