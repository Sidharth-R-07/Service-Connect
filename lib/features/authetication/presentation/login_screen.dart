import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:service_connect/core/services/custom_navigation.dart';
import 'package:service_connect/core/services/custom_toast.dart';
import 'package:service_connect/core/services/form_validations.dart';
import 'package:service_connect/core/utils/src/assets/app_svgs.dart';
import 'package:service_connect/core/utils/src/theme/app_colors.dart';
import 'package:service_connect/core/widgets/custom_button.dart';
import 'package:service_connect/core/widgets/custom_loading.dart';
import 'package:service_connect/core/widgets/custom_text_field.dart';
import 'package:service_connect/features/authetication/application/authentication_bloc.dart';
import 'package:service_connect/features/authetication/presentation/sign_up_screen.dart';
import 'package:service_connect/features/authetication/presentation/widgets/socail_media_button.dart';

import '../../home/presentation/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.result != null) {
          state.result!.fold(
            (failure) {
              CustomToast.errorToast(failure.errorMsg);
            },
            (user) {
              emailController.clear();
              passwordController.clear();
              context.read<AuthenticationBloc>().add(
                    AuthenticationEvent.setUser(user),
                  );
              CustomNavigation.pushAndRemoveUntil(context, const HomeScreen());
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.appColors.scaffoldBg,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Gap(100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(context.appSvgs.videoPlayeeIcon),
                      const Gap(10),
                      Text(
                        "Service Connect",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: context.appColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const Gap(60),
                  Text(
                    "Let's Log In.!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: context.appColors.primary,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    "Login to Your Account to Continue your Course",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: context.appColors.primary,
                    ),
                  ),
                  const Gap(40),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: context.appColors.white.withOpacity(.8),
                    ),
                    controller: emailController,
                    hintText: "Email",
                    validator: validateEmail,
                  ),
                  const Gap(20),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return CustomTextField(
                        keyboardType: TextInputType.visiblePassword,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: context.appColors.white.withOpacity(.8),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => context
                              .read<AuthenticationBloc>()
                              .add(const AuthenticationEvent
                                  .togglePasswordVisibility()),
                          icon: Icon(
                            state.obscurePassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                            color: context.appColors.white.withOpacity(.8),
                            size: 20,
                          ),
                        ),
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: state.obscurePassword,
                        validator: validatePassword,
                      );
                    },
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          return InkWell(
                            onTap: () => context.read<AuthenticationBloc>().add(
                                const AuthenticationEvent.toggleRememberMe()),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Checkbox(
                                    activeColor: context.appColors.primary,
                                    value: state.rememberMe,
                                    onChanged: (value) {
                                      context.read<AuthenticationBloc>().add(
                                          const AuthenticationEvent
                                              .toggleRememberMe());
                                    },
                                  ),
                                ),
                                const Gap(5),
                                Text(
                                  "Remember Me",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: context.appColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: context.appColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(36),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return CustomButton(
                        height: 54,
                        borderRadius: 30,
                        onPressed: () {
                          if (state.submitLoading) return;
                          _submitFn();
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Text(
                                  state.submitLoading ? "Loading..." : "Log In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: state.submitLoading
                                        ? context.appColors.white
                                            .withOpacity(.6)
                                        : context.appColors.white,
                                    fontStyle: state.submitLoading
                                        ? FontStyle.italic
                                        : FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: context.appColors.white,
                              radius: 20,
                              child: state.submitLoading
                                  ? CustomLoading(
                                      color: context.appColors.primary,
                                    )
                                  : Icon(
                                      Icons.arrow_forward,
                                      color: context.appColors.primary,
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Or Continue with",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: context.appColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocailMediaButton(
                        onPressed: () {},
                        iconPath: context.appSvgs.googleIcon,
                      ),
                      const Gap(20),
                      SocailMediaButton(
                        onPressed: () {},
                        iconPath: context.appSvgs.appleIcon,
                      ),
                    ],
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: context.appColors.primary,
                        ),
                      ),
                      const Gap(5),
                      InkWell(
                        onTap: () {
                          CustomNavigation.push(context, const SignUpScreen());
                        },
                        child: Text(
                          "Form",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: context.appColors.primary,
                            decoration: TextDecoration.underline,
                            decorationThickness: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitFn() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    context.read<AuthenticationBloc>().add(
          AuthenticationEvent.loginWithEmailAndPassword(
            email: email,
            password: password,
          ),
        );
  }
}
