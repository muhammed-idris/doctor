import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'dr_recommendation_card.dart';

class DrRecommendationWidget extends StatefulWidget {
  const DrRecommendationWidget({super.key});

  @override
  State<DrRecommendationWidget> createState() =>
      _DrRecommendationWidgetState();
}

class _DrRecommendationWidgetState extends State<DrRecommendationWidget> {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (context, index) => Gap(height * 0.005),
      itemBuilder: (context, index) {
        return const DrRecommendationCard();
      },
    );
  }
}