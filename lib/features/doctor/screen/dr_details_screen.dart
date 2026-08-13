import 'package:doctor/features/book_appointment/screens/book_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/back_app_bar.dart';
import '../../../shared/custom_container.dart';
import '../dr details/about_page.dart';
import '../dr details/doctor_tabs.dart';
import '../dr details/review_page.dart';

class DrDetailsScreen extends StatefulWidget {
  const DrDetailsScreen({super.key});

  @override
  State<DrDetailsScreen> createState() => _DrDetailsScreenState();
}

class _DrDetailsScreenState extends State<DrDetailsScreen> {
  final PageController _pageController = PageController();

  int selectedIndex = 0;

  final List<String> tabs = [
    'About',
    'Reviews',
  ];

  void _changePage(int index) {
    setState(() {
      selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Scaffold(
      appBar: BackAppBar(
        appBarTitle: "Recommendation Doctor",
        button: Icon(
          Icons.more_horiz_rounded,
          color: glass.textPrimary,
          size: 24,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: height * 0.03),
        child: Column(
          children: [
            CustomGlassCard(
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
                              padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                              child: Text(
                                "|",
                                style: TextStyles.buttonSmall.copyWith(
                                  color: glass.hintText,
                                  fontSize: 10,
                                ),
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
                            const Icon(Icons.star_rounded, color: Color(0xFFFFD600)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                              child: Text(
                                "4.8",
                                style: TextStyles.body.copyWith(color: glass.hintText),
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
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.015),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/chat-line-linear.png",
                        height: 30,
                        color: glass.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(height * 0.015),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: DoctorTabs(
                selectedIndex: selectedIndex,
                onTabSelected: _changePage,
              ),
            ),
            Gap(height * 0.01),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: const [
                  AboutPage(),
                  ReviewsPage(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            width * 0.05,
            height * 0.015,
            width * 0.05,
            height * 0.015,
          ),
          child: SizedBox(
            width: double.infinity,
            height: height * 0.065,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BookAppointmentScreen(),));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: glass.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Text(
                "Make An Appointment",
                style: TextStyles.headline1.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}