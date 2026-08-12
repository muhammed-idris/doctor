import 'package:flutter/material.dart';
import '../core/constants/app_theme_extension.dart';
import '../core/constants/text_styles.dart';
import 'custom_container.dart';

class BackAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BackAppBar({
    super.key,
    required this.appBarTitle,
    this.actionIcon,
    this.onActionPressed,
  });

  final String appBarTitle;
  final Icon? actionIcon;
  final VoidCallback? onActionPressed;

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
      actions: actionIcon != null
          ? [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: onActionPressed,
            icon: CustomGlassCard(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: width * 0.015),
              height: height * 0.04,
              borderRadius: 13,
              gradient: LinearGradient(colors: glass.surfaceGradient),
              borderColors: glass.borderColors,
              child: Center(
                child: actionIcon,
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