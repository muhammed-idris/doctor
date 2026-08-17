import 'package:flutter/material.dart';
import 'package:doctor/shared/custom_container.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';


class LogoutDialog extends StatelessWidget {
  final VoidCallback? onCancel;
  final VoidCallback? onLogout;

  const LogoutDialog({
    super.key,
    this.onCancel,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(
        horizontal: width * 0.055,
      ),
      child: CustomGlassCard(
        width: width,
        padding: EdgeInsets.zero,
        borderRadius: 20,
        blur: 20,
        backgroundColor: glass.background,
        borderColor: glass.hintText.withValues(alpha: 0.2),
        borderWidth: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
              ),
              child: Column(
                children: [
                  Text(
                    "Logout",
                    style: TextStyles.headline1.copyWith(
                      color: glass.textPrimary,
                    ),
                  ),

                  SizedBox(height: height * 0.015),

                  Text(
                    "You'll need to enter your username\n"
                        "and password next time\n"
                        "you want to login",
                    textAlign: TextAlign.center,
                    style: TextStyles.body.copyWith(
                      color: glass.hintText,
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Divider(
              height: 1,
              thickness: 1,
              color: glass.hintText.withValues(alpha: 0.15),
            ),

            // Buttons
            SizedBox(
              height: height * 0.06,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        onCancel?.call();
                      },
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyles.body.copyWith(
                            color: glass.primaryBlue,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 1,
                    height: height * 0.06,
                    color: glass.hintText.withValues(alpha: 0.15),
                  ),

                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        onLogout?.call();
                      },
                      child: Center(
                        child: Text(
                          "Logout",
                          style: TextStyles.body.copyWith(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}