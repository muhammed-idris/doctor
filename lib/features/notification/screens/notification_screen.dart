import 'package:doctor/core/constants/text_styles.dart';
import 'package:doctor/shared/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/color_manger.dart';
import '../widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Scaffold(
      appBar: BackAppBar(
          appBarTitle: "Notification",
        buttonColor: glass.primaryBlue,
        button: Text(
            "2 New",
          style: TextStyles.bodySmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(height * 0.02),
            Row(
              children: [
                Text(
                  "Today",
                  style: TextStyles.headline2.copyWith(color: glass.hintText),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Mark all as read",
                    style: TextStyles.headline2.copyWith(color: glass.primaryBlue),
                  ),
                ),
              ],
            ),
            Gap(height * 0.01),
            NotificationCard(
              icon: Icons.event_available_rounded,
              iconColor: const Color(0xFF16A34A),
              iconBackgroundColor: const Color(0xFFDCFCE7),
              title: "Appointment Success",
              subtitle: "Congratulations - your appointment is confirmed! We're looking forward to meeting with you and helping you achieve your goals.",
              time: "1h",
            ),
            NotificationCard(
              icon: Icons.event_repeat_rounded,
              iconColor: const Color(0xFF2563EB),
              iconBackgroundColor: const Color(0xFFDBEAFE),
              title: "Schedule Changed",
              subtitle: "You have successfully changed your appointment with Dr. Randy Wigham. Don't forget to active your reminder.",
              time: "5h",
              isRead: false,
            ),
            NotificationCard(
              icon: Icons.videocam_rounded,
              iconColor: const Color(0xFF16A34A),
              iconBackgroundColor: const Color(0xFFDCFCE7),
              title: "Video Call Appointment",
              subtitle: "We'll send you a link to join the call at the booking details, so all you need is a computer or mobile device with a camera and an internet connection.",
              time: "7h",
            ),

          ],
        ),
      ),
    );
  }
}
