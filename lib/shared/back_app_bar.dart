import 'package:doctor/core/constants/color_manger.dart';
import 'package:flutter/material.dart';
import '../core/constants/app_theme_extension.dart';
import '../core/constants/text_styles.dart';
import 'custom_container.dart';

class BackAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BackAppBar({
    super.key,
    required this.appBarTitle,
    this.button,
    this.onActionPressed,
    this.buttonColor,
    this.buttonColorBorder,
  });

  final String appBarTitle;
  final Widget? button;
  final VoidCallback? onActionPressed;
  final Color? buttonColor;
  final Color? buttonColorBorder;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return AppBar(
      backgroundColor: glass.background,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: CustomGlassCard(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: height * 0.045,
          borderRadius: 15,
          gradient: LinearGradient(colors: glass.surfaceGradient),
          borderColors: glass.borderColors,
          child: Center(
            child: Icon(Icons.arrow_back_ios_new_rounded, color: glass.textPrimary,size: 17,),
          ),
        ),
      ),
      title: Text(
        appBarTitle,
        style: TextStyles.overline.copyWith(color: glass.textPrimary),
      ),
      actions: button != null
          ? [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: onActionPressed,
            icon: CustomGlassCard(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              height: height * 0.045,
              borderRadius: 15,
              backgroundColor: buttonColor ?? GridColor.white850,
              borderColors: glass.borderColors,
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