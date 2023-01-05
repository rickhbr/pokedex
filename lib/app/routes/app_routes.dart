part of "app_pages.dart";

abstract class Routes {
  Routes._();

  //Welmoce
  static const welcome = _Paths.welcome;

  //Home
  static const home = _Paths.home;

  //Pokemon Details
  static const details = _Paths.details;
}

abstract class _Paths {
  _Paths._();

  static const welcome = '/welcome';
  static const home = '/home';
  static const details = '/details';
}
