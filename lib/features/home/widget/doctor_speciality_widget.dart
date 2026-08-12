import 'package:doctor/shared/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';

class DoctorSpecialityWidget extends StatefulWidget {
  final String title;
  final String imageLink;

  const DoctorSpecialityWidget({
    super.key,
    required this.title,
    required this.imageLink});

  @override
  State<DoctorSpecialityWidget> createState() => _DoctorSpecialityWidgetState();
}

class _DoctorSpecialityWidgetState extends State<DoctorSpecialityWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Column(
      children: [
        CustomGlassCard(
          height: height * 0.08,
          width: width * 0.18,
          shadow: [
            BoxShadow(
              color: glass.shadow,
              blurRadius: 3,
              offset: const Offset(0, 4),
            ),
          ],
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.015,
          ),
          borderColors: glass.borderColors,
          borderRadius: 50,
          backgroundColor: glass.doctorBackGround,
            child: Image.asset(
                widget.imageLink,
              fit: BoxFit.contain,
              width: width * 0.075,
            ),
        ),
        Gap(height * 0.01),
        Text(
          widget.title,
          style: TextStyles.bodySmall.copyWith(color: glass.textPrimary),
        ),
      ],
    );
  }
}
