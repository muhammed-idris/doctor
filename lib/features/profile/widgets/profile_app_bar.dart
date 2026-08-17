import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/color_manger.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/custom_container.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
    required this.appBarTitle,
    this.button,
    this.onActionPressed,
    this.buttonColor,
    this.buttonColorBorder,
    this.showBackButton = true,
    this.backColor,
  });

  final String appBarTitle;
  final Widget? button;
  final VoidCallback? onActionPressed;
  final Color? buttonColor;
  final Color? buttonColorBorder;
  final bool showBackButton;
  final Color? backColor;

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: backColor ?? glass.background,
      centerTitle: true,
      toolbarHeight: height * 0.09,

      // Back button
      leading: showBackButton
          ? IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: CustomGlassCard(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: height * 0.045,
          borderRadius: 15,
          backgroundColor: Colors.transparent,
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: glass.textPrimary,
              size: 17,
            ),
          ),
        ),
      )
          : null,

      title: Text(
        appBarTitle,
        style: TextStyles.overline.copyWith(
          color: glass.textPrimary,
        ),
      ),

      actions: button != null
          ? [
        Padding(
          padding: EdgeInsets.zero,
          child: IconButton(
            onPressed: onActionPressed,
            icon: CustomGlassCard(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
              ),
              height: height * 0.045,
              borderRadius: 15,
              backgroundColor:
              buttonColor ?? GridColor.white850,
              child: Center(
                child: button,
              ),
            ),
          ),
        ),
      ]
          : null,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
    );
  }
}