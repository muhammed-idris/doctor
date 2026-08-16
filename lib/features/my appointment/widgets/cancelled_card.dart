import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/custom_container.dart';
import 'appointment_state.dart';

class CancelledCard extends StatelessWidget {
  const CancelledCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Column(
      children: [
        const AppointmentStatusCard(
          cancelled: true,
        ),
        CustomGlassCard(
          backgroundColor: Colors.transparent,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/images/dr_randy.png",
                  width: width * 0.25,
                  height: width * 0.25,
                  fit: BoxFit.cover,
                ),
              ),

              Gap(width * 0.03),

              // Doctor information
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.015,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Randy Wigham",
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
                          Text(
                            "General",
                            style: TextStyles.body.copyWith(
                              color: glass.hintText,
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

                          Expanded(
                            child: Text(
                              "RSUD Gatot Subroto",
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
                            size: 20,
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

                          Expanded(
                            child: Text(
                              "(4,279 reviews)",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.body.copyWith(
                                color: glass.hintText,
                              ),
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
      ],
    );
  }
}