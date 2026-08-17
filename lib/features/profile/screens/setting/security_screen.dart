import 'package:doctor/features/notification/screens/notification_screen.dart';
import 'package:doctor/features/profile/screens/setting/faq_screen.dart';
import 'package:doctor/shared/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/notification_widget.dart';
import '../../widgets/setting_widget.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BackAppBar(appBarTitle: "Setting"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          children: [
            NotificationSettingWidget(title: "Remember password", value: true),
            NotificationSettingWidget(title: "Face ID", value: true),
            NotificationSettingWidget(title: "PIN", value: true),
            ProfileSettingWidget(
              icon: Image.asset(
                "assets/icons/Group 427323113.png",
                width: width * 0.055,
              ),
              iconBackgroundColor: Colors.transparent,
              title: "Google Authenticator",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
