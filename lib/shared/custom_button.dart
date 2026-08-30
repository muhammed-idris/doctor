import 'package:flutter/material.dart';

import '../core/constants/app_theme_extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return SizedBox(
      width: width,
      height: height * 0.065,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: glass.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.04),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}