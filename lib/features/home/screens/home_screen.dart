import 'package:doctor/features/home/screens/doctor_speciality_screen.dart';
import 'package:doctor/features/doctor/screen/dr_recommendation_screen.dart';
import 'package:doctor/features/home/widget/doctor_speciality_widget.dart';
import 'package:doctor/features/home/widget/nearby_widget.dart';
import 'package:doctor/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/color_manger.dart';
import '../../../core/constants/text_styles.dart';
import '../../doctor/widget/dr_recommendation_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Scaffold(
      appBar: CustomAppBar(title: 'User'),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              NearbyWidget(),
              Gap(height * 0.01),
              Row(
                children: [
                  Text(
                    "Doctor Speciality",
                    style: TextStyles.appBar.copyWith(color: AppColors.black),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorSpecialityScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyles.headline2.copyWith(color: AppColors.primaryBlue),
                    ),
                  ),
                ],
              ),
              Gap(height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DoctorSpecialityWidget(
                    title: "General",
                    imageLink: "assets/speciality/Man Doctor Europe 1.png",
                  ),
                  DoctorSpecialityWidget(
                    title: "Neurologic",
                    imageLink: "assets/speciality/Brain 1.png",
                  ),
                  DoctorSpecialityWidget(
                    title: "Pediatric",
                    imageLink: "assets/speciality/Iamge.png",
                  ),
                  DoctorSpecialityWidget(
                    title: "Radiology",
                    imageLink: "assets/speciality/Kidneys 1.png",
                  ),
                ],
              ),
              Gap(height * 0.015),
              Row(
                children: [
                  Text(
                    "Recommendation Doctor",
                    style: TextStyles.appBar.copyWith(color: glass.textPrimary),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DrRecommendationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyles.headline2.copyWith(color: AppColors.primaryBlue),
                    ),
                  ),
                ],
              ),
              Gap(height * 0.01),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => Gap(height * 0.005),
                itemBuilder: (context, index) {
                  return const DrRecommendationCard();
                },
              ),
              Gap(height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}