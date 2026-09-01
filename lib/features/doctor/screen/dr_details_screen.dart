import 'package:doctor/features/book_appointment/screens/book_appointment_screen.dart';
import 'package:doctor/features/inbox/screens/inbox_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../data/models/doctor_model/doctor_model.dart';
import '../../../shared/back_app_bar.dart';
import '../../../shared/custom_container.dart';

import '../dr details/about_page.dart';
import '../dr details/doctor_tabs.dart';
import '../dr details/review_page.dart';
import '../../../data/models/doctor_model/dr_model.dart' as booking;

class DrDetailsScreen extends StatefulWidget {
  final DoctorModel doctor;

  const DrDetailsScreen({super.key, required this.doctor});

  @override
  State<DrDetailsScreen> createState() => _DrDetailsScreenState();
}

class _DrDetailsScreenState extends State<DrDetailsScreen> {
  final PageController _pageController = PageController();

  int selectedIndex = 0;

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
    final doctor = widget.doctor;

    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Scaffold(
      appBar: BackAppBar(
        appBarTitle: "Doctor Details",
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
            // ================= HEADER =================
            CustomGlassCard(
              backgroundColor: Colors.transparent,
              width: width,

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: SizedBox(
                      width: width * 0.22,
                      height: width * 0.22,

                      child: doctor.photo.isNotEmpty
                          ? Image.network(
                               doctor.photo,
                              fit: BoxFit.cover,

                              errorBuilder: (_, __, ___) {
                                return Image.asset(
                                  "assets/images/dr_randy.png",
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              "assets/images/dr_randy.png",
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),

                  Gap(width * 0.025),

                  // Information
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.005,
                        bottom: height * 0.015,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            doctor.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: TextStyles.headline1.copyWith(
                              color: glass.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          Gap(height * 0.01),

                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  doctor.specialization.name.isEmpty
                                      ? "General"
                                      : doctor.specialization.name,

                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyles.body.copyWith(
                                    color: glass.hintText,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.015,
                                ),

                                child: Text(
                                  "|",

                                  style: TextStyles.buttonSmall.copyWith(
                                    color: glass.hintText,
                                    fontSize: 10,
                                  ),
                                ),
                              ),

                              Flexible(
                                child: Text(
                                  doctor.city.name.isEmpty
                                      ? "Unknown City"
                                      : doctor.city.name,

                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: TextStyles.body.copyWith(
                                    color: glass.hintText,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Gap(height * 0.01),

                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Color(0xFFFFD600),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.015,
                                ),

                                child: Text(
                                  "4.8",

                                  style: TextStyles.body.copyWith(
                                    color: glass.hintText,
                                  ),
                                ),
                              ),

                              Text(
                                "(Reviews)",

                                style: TextStyles.body.copyWith(
                                  color: glass.hintText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Chat
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.015),

                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const InboxScreen(),
                          ),
                        );
                      },

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

            // ================= TABS =================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),

              child: DoctorTabs(
                selectedIndex: selectedIndex,
                onTabSelected: _changePage,
              ),
            ),

            Gap(height * 0.01),

            // ================= PAGE VIEW =================
            Expanded(
              child: PageView(
                controller: _pageController,

                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                children: [
                  AboutPage(doctor: doctor),

                  const ReviewsPage(),
                ],
              ),
            ),
          ],
        ),
      ),

      // ================= APPOINTMENT =================
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookAppointmentScreen(
                      doctor: booking.DoctorInfo.fromModel(doctor),
                    ),
                  ),
                );
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
