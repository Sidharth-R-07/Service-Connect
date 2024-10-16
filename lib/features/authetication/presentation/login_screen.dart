import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:service_connect/core/utils/src/assets/app_svgs.dart';
import 'package:service_connect/core/utils/src/theme/app_colors.dart';
import 'package:service_connect/core/widgets/custom_button.dart';
import 'package:service_connect/core/widgets/custom_text_field.dart';
import 'package:service_connect/features/authetication/presentation/widgets/socail_media_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.scaffoldBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
              controller: TextEditingController(),
              hintText: "Email",
            ),
            const Gap(20),
            CustomTextField(
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: context.appColors.white.withOpacity(.8),
              ),
              suffixIcon: Icon(
                Icons.visibility_off_outlined,
                color: context.appColors.white.withOpacity(.8),
                size: 20,
              ),
              controller: TextEditingController(),
              hintText: "Password",
              obscureText: true,
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Checkbox(
                        value: false,
                        onChanged: (value) {},
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
            CustomButton(
              height: 54,
              borderRadius: 30,
              onPressed: () {},
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        "Log In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: context.appColors.white,
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: context.appColors.white,
                    radius: 20,
                    child: Icon(
                      Icons.arrow_forward,
                      color: context.appColors.primary,
                    ),
                  ),
                ],
              ),
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
                  onTap: () {},
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
    );
  }
}
