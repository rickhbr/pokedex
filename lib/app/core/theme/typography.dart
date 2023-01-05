import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:mix/mix.dart";

class Typography {
  /// Font used in project
  final fontNunitoTextTheme = GoogleFonts.nunitoTextTheme;
  final fontNunito = GoogleFonts.nunito;

  static final _defaultFont = Mix(
    textStyle(const TextStyle(fontFamily: "nunito")),
  );

  final double textScaleFactor = 1.0;

  final h1Typo =
      Mix.combine(_defaultFont, Mix(fontSize(35), letterSpacing(0.23)));

  final t1Typo = Mix.combine(_defaultFont, Mix(fontSize(18), letterSpacing(2)));
  final t2Typo = Mix.combine(_defaultFont, Mix(fontSize(16), letterSpacing(2)));
  final t3Typo = Mix.combine(_defaultFont, Mix(fontSize(14), letterSpacing(2)));
  final t4Typo = Mix.combine(_defaultFont, Mix(fontSize(12), letterSpacing(2)));
}
