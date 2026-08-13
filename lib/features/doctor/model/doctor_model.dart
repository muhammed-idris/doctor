import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/custom_container.dart';


class DoctorInfo {
  const DoctorInfo({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.reviewCount,
    this.imagePath,
  });

  final String name;
  final String specialty;
  final double rating;
  final int reviewCount;
  final String? imagePath;

  static const placeholder = DoctorInfo(
    name: 'Dr. Randy Wigham',
    specialty: 'General | RSUD Gatot Subroto',
    rating: 4.8,
    reviewCount: 4279,
  );
}

/// Glass card showing a doctor's photo, name, specialty and rating.
class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({super.key, required this.doctor});

  final DoctorInfo doctor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return CustomGlassCard(
      width: width,
      borderRadius: 20,
      blur: 20,
      borderWidth: 1,
      borderColors: glass.borderColors,
      backgroundColor: glass.background,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: doctor.imagePath != null
                ? Image.asset(
              doctor.imagePath!,
              width: width * 0.16,
              height: width * 0.16,
              fit: BoxFit.cover,
            )
                : Container(
              width: width * 0.16,
              height: width * 0.16,
              color: glass.primaryBlue.withValues(alpha: 0.08),
              child: Icon(
                Icons.person_outline,
                size: width * 0.09,
                color: glass.primaryBlue,
              ),
            ),
          ),
          Gap(width * 0.035),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor.name,
                  style: TextStyles.headline2.copyWith(
                    color: glass.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(4),
                Text(
                  doctor.specialty,
                  style: TextStyles.bodySmall.copyWith(color: glass.hintText),
                ),
                const Gap(6),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, size: 18, color: Colors.amber),
                    const Gap(2),
                    Text(
                      '${doctor.rating} (${NumberFormat.decimalPattern().format(doctor.reviewCount)} reviews)',
                      style: TextStyles.bodySmall.copyWith(
                        color: glass.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}