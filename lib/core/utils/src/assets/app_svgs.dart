import 'package:flutter/material.dart';

class AppSvgs {
  final String videoPlayeeIcon = "assets/svgs/video_player_icon_.svg";
  final String googleIcon = "assets/svgs/google-icon.svg";
  final String appleIcon = "assets/svgs/apple-icon.svg";
}

extension AppSvgExtension on BuildContext {
  AppSvgs get appSvgs => AppSvgs();
}
