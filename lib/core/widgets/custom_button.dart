import 'package:flutter/material.dart';
import 'package:service_connect/core/utils/src/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;
  final double width;
  final double height;
  final double borderRadius;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.color,
      this.width = double.infinity,
      this.borderRadius = 10,
      this.height = 46});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: const EdgeInsets.all(8),
      color: color ?? context.appColors.primary,
      onPressed: onPressed,
      child: child,
    );
  }
}
