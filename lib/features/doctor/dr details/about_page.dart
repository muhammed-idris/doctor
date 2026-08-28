import 'package:flutter/material.dart';

import '../../../data/models/doctor_model/doctor_model.dart';

class AboutPage extends StatelessWidget {
  final DoctorModel doctor;

  const AboutPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            'About me',

            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Text(
            doctor.description?.isNotEmpty == true
                ? doctor.description!
                : 'No description available.',
          ),

          const SizedBox(height: 25),

          const Text(
            'Working Time',

            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Text(
            doctor.startTime != null && doctor.endTime != null
                ? '${doctor.startTime} - ${doctor.endTime}'
                : 'Working time not available',
          ),

          const SizedBox(height: 25),

          if (doctor.degree != null && doctor.degree!.isNotEmpty) ...[
            const Text(
              'Degree',

              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(doctor.degree!),

            const SizedBox(height: 25),
          ],

          if (doctor.address != null && doctor.address!.isNotEmpty) ...[
            const Text(
              'Address',

              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(doctor.address!),
          ],
        ],
      ),
    );
  }
}
