import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';

class ProfileOptionWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final VoidCallback? onTap;

  const ProfileOptionWidget({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.015,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: glass.colorIcons,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.105,
              height: width * 0.105,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(
                  width * 0.035,
                ),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: width * 0.055,
              ),
            ),

            SizedBox(width: width * 0.04),

            Text(
              title,
              style: TextStyles.body.copyWith(
                color: glass.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}