import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_connect/core/utils/di/injection.dart';
import 'package:service_connect/core/utils/src/theme/app_colors.dart';
import 'package:service_connect/core/utils/src/theme/app_fonts.dart';
import 'package:service_connect/features/authetication/application/authentication_bloc.dart';
import 'package:service_connect/features/authetication/domain/i_authetication_facade.dart';
import 'package:service_connect/features/authetication/presentation/login_screen.dart';
import 'package:service_connect/features/location/application/location_bloc.dart';
import 'package:service_connect/features/location/domain/i_location_facade.dart';
import 'package:service_connect/features/splash/presentation/splash_screen.dart';

Future<void> main() async {
  await configureDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // AuthenticationBloc
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(sl<IAutheticationFacade>()),
        ),

        //LocationBloc
        BlocProvider<LocationBloc>(
          create: (context) => LocationBloc(sl<ILocationFacade>()),
        ),
      ],
      child: MaterialApp(
        title: 'Service Connect',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          fontFamily: context.appFonts.poppins,
          colorScheme:
              ColorScheme.fromSeed(seedColor: context.appColors.primary),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
