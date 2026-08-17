import 'package:doctor/shared/back_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/notification_widget.dart';
import '../../widgets/setting_widget.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BackAppBar(appBarTitle: "Setting"),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.06
        ),
        child: Column(
          children: [
            NotificationSettingWidget(
              title: "Notification from DocNow",
              value: true,
            ),

            NotificationSettingWidget(
              title: "Sound",
              value: true,
            ),

            NotificationSettingWidget(
              title: "Vibrate",
              value: true,
            ),

            NotificationSettingWidget(
              title: "App Updates",
              value: false,
            ),

            NotificationSettingWidget(
              title: "Special Offers",
              value: true,
            ),
          ],
        )
      ),
    );
  }
}
