import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_extension.dart';

class AppointmentStatusCard extends StatelessWidget {
  final bool cancelled;

  const AppointmentStatusCard({
    super.key,
    this.cancelled = false,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    final statusColor = cancelled ? Colors.red : Colors.green;

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.015,
      ),
      decoration: BoxDecoration(
        color: glass.background,
        borderRadius: BorderRadius.circular(width * 0.025),
        border: Border(
          left: BorderSide(
            color: statusColor,
            width: width * 0.008,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: width * 0.025,
            offset: Offset(0, height * 0.004),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cancelled
                      ? "Appointment cancelled"
                      : "Appointment done",
                  style: TextStyle(
                    color: statusColor,
                    fontSize: width * 0.028,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: height * 0.008),

                Text(
                  "Wed, 17 May  |  08.30 AM",
                  style: TextStyle(
                    color: glass.hintText,
                    fontSize: width * 0.025,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.more_vert,
            size: width * 0.05,
            color: glass.hintText,
          ),
        ],
      ),
    );
  }
}