import 'package:flutter/material.dart';
import 'package:service_connect/core/utils/src/theme/app_colors.dart';

class CustomLoading extends StatelessWidget {
  final Color? color;
  final double size;
  const CustomLoading({super.key, this.color, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          color: color ?? context.appColors.white,
          strokeWidth: 2.2,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
