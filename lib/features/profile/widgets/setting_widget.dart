import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';

class ProfileSettingWidget extends StatelessWidget {
  final Widget icon;
  final Color iconBackgroundColor;
  final String title;
  final VoidCallback? onTap;

  const ProfileSettingWidget({
    super.key,
    required this.icon,
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
          vertical: height * 0.02,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: glass.hintText.withValues(alpha: 0.15),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.09,
              height: width * 0.09,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: icon,
            ),

            SizedBox(width: width * 0.035),

            Expanded(
              child: Text(
                title,
                style: TextStyles.body.copyWith(
                  color: glass.textPrimary,
                ),
              ),
            ),

            Icon(
              Icons.chevron_right,
              size: width * 0.05,
              color: glass.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}