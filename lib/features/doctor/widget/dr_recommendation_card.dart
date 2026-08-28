import 'package:doctor/core/constants/app_theme_extension.dart';
import 'package:doctor/core/constants/text_styles.dart';
import 'package:doctor/features/doctor/screen/dr_details_screen.dart';
import 'package:doctor/shared/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/models/doctor_model/doctor_model.dart';

class DrRecommendationCard extends StatelessWidget {
  final DoctorModel doctor;

  const DrRecommendationCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DrDetailsScreen(doctor: doctor),
          ),
        );
      },

      child: CustomGlassCard(
        backgroundColor: Colors.transparent,
        width: width,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= IMAGE =================
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: SizedBox(
                width: width * 0.22,
                height: width * 0.22,

                child: doctor.photo != null && doctor.photo!.isNotEmpty
                    ? Image.network(
                        doctor.photo!,
                        fit: BoxFit.cover,

                        errorBuilder: (context, error, stackTrace) {
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

            // ================= INFORMATION =================
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: height * 0.015,
                  bottom: height * 0.015,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // Name
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

                    // Specialization + City
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            doctor.specialization?.name ?? "General",

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
                            doctor.city?.name ?? "Unknown City",

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

                    // Rating
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
          ],
        ),
      ),
    );
  }
}
