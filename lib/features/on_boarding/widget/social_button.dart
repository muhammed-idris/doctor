import 'package:flutter/material.dart';
import '../../../core/constants/app_theme_extension.dart';
import '../../../shared/custom_container.dart';

class SocialLoginButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const SocialLoginButton({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;


    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: CustomGlassCard(
        width: width * 0.15,
        height: height * 0.06,
        borderRadius: 100,
        gradient: LinearGradient(colors: glass.surfaceGradient),
        padding: EdgeInsets.zero,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}