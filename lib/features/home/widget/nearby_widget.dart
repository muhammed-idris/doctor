import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/color_manger.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/custom_container.dart';

class NearbyWidget extends StatefulWidget {
  const NearbyWidget({super.key});

  @override
  State<NearbyWidget> createState() => _NearbyWidgetState();
}

class _NearbyWidgetState extends State<NearbyWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomGlassCard(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.015,
          ),

          width: width * 1,
          borderRadius: 20,
          gradient: LinearGradient(colors: glass.nearbyColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book and\nschedule with\nnearest doctor",
                style: TextStyles.overline.copyWith(color: AppColors.white),
              ),
              Gap(height * 0.01),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Find Nearby",
                  style: TextStyles.success.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            "assets/images/Image.png",
            height: height * 0.2,
            width: width * 0.4,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
