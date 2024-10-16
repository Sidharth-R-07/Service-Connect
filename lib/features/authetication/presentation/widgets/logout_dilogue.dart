import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:service_connect/core/services/custom_navigation.dart';
import 'package:service_connect/core/services/custom_toast.dart';
import 'package:service_connect/core/utils/src/theme/app_colors.dart';
import 'package:service_connect/core/widgets/custom_button.dart';
import 'package:service_connect/core/widgets/custom_loading.dart';
import 'package:service_connect/features/authetication/application/authentication_bloc.dart';
import 'package:service_connect/features/authetication/presentation/login_screen.dart';

class LogoutDilogue extends StatefulWidget {
  const LogoutDilogue({super.key});

  @override
  State<LogoutDilogue> createState() => _LogoutDilogueState();
}

class _LogoutDilogueState extends State<LogoutDilogue> {
  @override
  void initState() {
    context
        .read<AuthenticationBloc>()
        .add(const AuthenticationEvent.clearLogoutResult());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.logoutResult != null) {
          state.logoutResult!.fold(
            (l) => CustomToast.errorToast(l.errorMsg),
            (r) {
              CustomToast.successToast('Logout successful');
              Navigator.of(context).pop();
              CustomNavigation.pushAndRemoveUntil(context, const LoginScreen());
            },
          );
        }
      },
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Logout',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: state.submitLoading
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomLoading(
                      color: context.appColors.primary,
                    ),
                    const Gap(10),
                    const Text('Logging out...'),
                  ],
                )
              : const Text('Are you sure you want to logout?',
                  textAlign: TextAlign.center),
          actions: state.submitLoading
              ? []
              : <Widget>[
                  CustomButton(
                      width: 80,
                      height: 38,
                      color: context.appColors.grey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: context.appColors.primary),
                      )),
                  CustomButton(
                      width: 80,
                      height: 38,
                      color: context.appColors.white,
                      onPressed: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(const AuthenticationEvent.logOut());
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(color: context.appColors.errror),
                      )),
                ],
        );
      },
    );
  }
}
