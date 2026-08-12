import 'package:doctor/core/constants/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_container.dart';

class NotificationCard extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isRead = true,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return CustomGlassCard(
      backgroundColor: widget.isRead ? Colors.transparent : const Color(0xFFF2F3F5),
      width: width * 1,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.035),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width * 0.1,
              height: width * 0.1,
              decoration: BoxDecoration(
                color: widget.iconBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(widget.icon, color: widget.iconColor, size: width * 0.045),
            ),
            Gap(width * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: glass.textPrimary,
                    ),
                  ),
                  Gap(height * 0.005),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.35,
                      color: glass.textPrimary.withValues(alpha: 0.55),
                    ),
                  ),
                ],
              ),
            ),
            Gap(width * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.time,
                  style: TextStyle(
                    fontSize: 11,
                    color: glass.textPrimary.withValues(alpha: 0.4),
                  ),
                ),
                if (!widget.isRead) ...[
                  Gap(height * 0.008),
                  Container(
                    width: width * 0.015,
                    height: width * 0.015,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF4444),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}