import 'package:flutter/material.dart';

class AppFonts {
  final String poppins = 'Poppins';
}

extension AppFontScheme on BuildContext {
  AppFonts get appFonts => AppFonts();
}
