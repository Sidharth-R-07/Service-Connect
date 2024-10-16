import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocailMediaButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  const SocailMediaButton(
      {super.key, required this.onPressed, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: IconButton(
        icon: SvgPicture.asset(iconPath),
        onPressed: onPressed,
      ),
    );
  }
}
