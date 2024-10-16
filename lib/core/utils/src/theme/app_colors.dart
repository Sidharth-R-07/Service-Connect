import 'package:flutter/material.dart';

class AppColors {
  final Color primary = const Color(0xFF1d1f2b);
  final Color secondary = const Color(0xFF736967);
  final Color text = const Color(0xFF4e4e50);
  final Color scaffoldBg = const Color(0xFFd9d9db);
  final Color white = const Color(0xFFFFFFFF);
  final Color grey = const Color(0xffced3dc);
  final Color black = const Color(0xFF000000);
  final Color errror = const Color(0xFFff0000);
}

extension AppColorExtension on BuildContext {
  AppColors get appColors => AppColors();
}
