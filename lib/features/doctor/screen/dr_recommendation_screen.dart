import 'package:doctor/shared/back_app_bar.dart';
import 'package:doctor/shared/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../widget/dr_recommendation_widget.dart';
import '../widget/dr_sheet.dart';

class DrRecommendationScreen extends StatefulWidget {
  const DrRecommendationScreen({super.key});

  @override
  State<DrRecommendationScreen> createState() => _DrRecommendationScreenState();
}

class _DrRecommendationScreenState extends State<DrRecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: BackAppBar(
          appBarTitle: "Recommendation Doctor",
          button: Icon(
            Icons.more_horiz_rounded,
            color: glass.textPrimary,
            size: 24,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: height * 0.03,
            left: width * 0.04,
            right: width * 0.04,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               CustomSearchBar(),
                Gap(height * 0.015),
                DrRecommendationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
