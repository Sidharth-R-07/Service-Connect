import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_connect/core/services/custom_navigation.dart';
import 'package:service_connect/core/services/local_storage_services.dart';
import 'package:service_connect/core/utils/di/injection.dart';
import 'package:service_connect/core/utils/src/assets/app_svgs.dart';
import 'package:service_connect/features/authetication/application/authentication_bloc.dart';
import 'package:service_connect/features/authetication/domain/model/user_model.dart';
import 'package:service_connect/features/authetication/presentation/login_screen.dart';
import 'package:service_connect/features/home/presentation/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: use_build_context_synchronously
    Future.delayed(const Duration(seconds: 2), () => _fetchData(context));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(context.appSvgs.videoPlayeeIcon),
            const SizedBox(height: 20),
            const Text(
              'Service Connect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchData(BuildContext context) async {
    final isLoggedIn = await sl<LocalStorageServices>().getUserId();
    if (isLoggedIn != null) {
      // ignore: use_build_context_synchronously
      context
          .read<AuthenticationBloc>()
          .add(AuthenticationEvent.setUser(UserModel(email: isLoggedIn)));
      // ignore: use_build_context_synchronously
      CustomNavigation.pushReplacement(context, const HomeScreen());
    } else {
      // ignore: use_build_context_synchronously
      CustomNavigation.pushReplacement(context, const LoginScreen());
    }
  }
}
