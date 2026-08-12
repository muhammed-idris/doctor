import 'package:doctor/core/constants/app_theme_extension.dart';
import 'package:doctor/core/constants/text_styles.dart';
import 'package:doctor/shared/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DrRecommendationCard extends StatefulWidget {
  const DrRecommendationCard({super.key});

  @override
  State<DrRecommendationCard> createState() => _DrRecommendationCardState();
}

class _DrRecommendationCardState extends State<DrRecommendationCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return CustomGlassCard(
      backgroundColor: Colors.transparent,
      width: width * 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/dr_randy.png"),
          Gap(width * 0.01),
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.015,
              bottom: height * 0.015,
              left: width * 0.015,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dr. Randy Wigham",
                  style: TextStyles.headline1.copyWith(
                    color: glass.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gap(height * 0.01),
                Row(
                  children: [
                    Text(
                      "General",
                      style: TextStyles.body.copyWith(color: glass.hintText),
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: width * 0.015),
                      child: Text(
                        "|",
                        style: TextStyles.buttonSmall.copyWith(color: glass.hintText,fontSize: 10),
                      ),
                    ),
                    Text(
                      "RSUD Gatot Subroto",
                      style: TextStyles.body.copyWith(color: glass.hintText),
                    ),
                  ],
                ),
                Gap(height * 0.01),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,color: Color(0xFFFFD600),
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: width * 0.015),
                      child: Text(
                        "4.8",
                        style: TextStyles.body.copyWith(color: glass.hintText,),
                      ),
                    ),
                    Text(
                      "(4,279 reviews)",
                      style: TextStyles.body.copyWith(color: glass.hintText),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
