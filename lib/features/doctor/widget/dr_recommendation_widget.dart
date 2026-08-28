import 'package:doctor/features/doctor/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/models/doctor_model/doctor_model.dart';
import 'dr_recommendation_card.dart';

class DrRecommendationWidget extends StatelessWidget {
  final List<DoctorModel> doctors;

  const DrRecommendationWidget({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemCount: doctors.length,

      separatorBuilder: (context, index) {
        return Gap(height * 0.005);
      },

      itemBuilder: (context, index) {
        return DrRecommendationCard(doctor: doctors[index]);
      },
    );
  }
}
