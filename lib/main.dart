import 'package:flutter/material.dart';
import 'package:service_connect/core/utils/di/injection.dart';
import 'package:service_connect/core/utils/src/theme/app_colors.dart';
import 'package:service_connect/core/utils/src/theme/app_fonts.dart';
import 'package:service_connect/features/authetication/presentation/login_screen.dart';

Future<void> main() async {
  await configureDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Connect',
      theme: ThemeData(
        fontFamily: context.appFonts.poppins,
        colorScheme: ColorScheme.fromSeed(seedColor: context.appColors.primary),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
