import 'package:doctor/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: glass.borderFieldColor,
            thickness: 1.5,
          ),
        ),

        SizedBox(width: width * 0.02),

        Text(
          'Or sign in with',
          style: TextStyles.body.copyWith(
            color: glass.hintText
          ),
        ),

        SizedBox(width: width * 0.02),

        Expanded(
          child: Divider(
            color: glass.borderFieldColor,
            thickness: 1.5,
          ),
        ),
      ],
    );
  }
}