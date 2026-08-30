import 'package:doctor/core/constants/text_styles.dart';
import 'package:doctor/features/profile/screens/settings_screen.dart';
import 'package:doctor/features/my appointment/screens/my_appointment_screen.dart';
import 'package:doctor/shared/back_app_bar.dart';
import 'package:doctor/shared/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_option_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Scaffold(
      backgroundColor: glass.primaryBlue,
      body: Stack(
        children: [
          // White main background
          Positioned(
            top: height * 0.237,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: glass.background,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(width * 0.06),
                ),
              ),
            ),
          ),

          // White circle behind profile image
          Positioned(
            top: height * 0.163,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: width * 0.34,
                    height: width * 0.34,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      "assets/images/Image3.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  // Edit button
                  Positioned(
                    right: 1,
                    bottom: 15,
                    child: Container(
                      width: width * 0.08,
                      height: width * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      child: Image.asset("assets/icons/Group 33825.png"),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Your content
          Column(
            children: [
              ProfileAppBar(
                showBackButton: false,
                backColor: Colors.transparent,
                buttonColor: Colors.transparent,
                appBarTitle: "Profile",
                button: Image.asset(
                  "assets/icons/setting2.png",
                  width: width * 0.055,
                ),
                onActionPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
              ),

              Gap(height * 0.18),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Column(
                  children: [
                    Text(
                      "user",
                      style: TextStyles.display.copyWith(
                        color: glass.textPrimary,
                      ),
                    ),

                    Gap(height * 0.005),

                    Text(
                      "user@gmail.com",
                      style: TextStyles.headline1.copyWith(
                        color: glass.hintText,
                      ),
                    ),

                    Gap(height * 0.03),

                    // Appointment / Medical Records
                    Container(
                      height: height * 0.072,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(16),
                              ),
                               onTap: () {
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                     builder: (_) => const MyAppointmentScreen(),
                                   ),
                                 );
                               },
                              child: Center(
                                child: Text(
                                  "My Appointment",
                                  style: TextStyles.body.copyWith(
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: 1,
                            height: height * 0.05,
                            color: Colors.grey.shade300,
                          ),

                          Expanded(
                            child: InkWell(
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(16),
                              ),
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "Medical records",
                                  style: TextStyles.body.copyWith(
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Gap(height * 0.02),

                    // Options
                    ProfileOptionWidget(
                      icon: Icons.badge_outlined,
                      iconColor: Colors.blue,
                      iconBackgroundColor: Colors.blue.shade50,
                      title: "Personal Information",
                      onTap: () {},
                    ),

                    ProfileOptionWidget(
                      icon: Icons.medical_services_outlined,
                      iconColor: Colors.green,
                      iconBackgroundColor: Colors.green.shade50,
                      title: "My Test & Diagnostic",
                      onTap: () {},
                    ),

                    ProfileOptionWidget(
                      icon: Icons.credit_card_outlined,
                      iconColor: Colors.red,
                      iconBackgroundColor: Colors.red.shade50,
                      title: "Payment",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
