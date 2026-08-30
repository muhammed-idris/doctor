import 'package:flutter/material.dart';

import '../../../data/models/doctor_model/doctor_model.dart' as api;

class DoctorInfo {
  final String name;
  final String specialty;
  final String location;
  final String imageAsset;
  final String? imageUrl;

  const DoctorInfo({
    required this.name,
    required this.specialty,
    required this.location,
    required this.imageAsset,
    this.imageUrl,
  });

  factory DoctorInfo.fromModel(api.DoctorModel doctor) {
    final specialty = doctor.specialization.name.trim();
    final city = doctor.city.name.trim();
    final photo = doctor.photo.trim();

    return DoctorInfo(
      name: doctor.name.trim().isEmpty ? 'Doctor' : doctor.name.trim(),
      specialty: specialty.isEmpty ? 'General Medicine' : specialty,
      location: city.isEmpty ? 'Clinic location' : city,
      imageAsset: 'assets/images/dr_randy.png',
      imageUrl: photo.isEmpty ? null : photo,
    );
  }

  static const placeholder = DoctorInfo(
    name: 'Dr. Randy Smith',
    specialty: 'General Medicine',
    location: 'Clinic location',
    imageAsset: 'assets/images/dr_randy.png',
  );
}

class DoctorInfoCard extends StatelessWidget {
  final DoctorInfo doctor;

  const DoctorInfoCard({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: doctor.imageUrl != null
                  ? Image.network(
                      doctor.imageUrl!,
                      width: 58,
                      height: 58,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                        doctor.imageAsset,
                        width: 58,
                        height: 58,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.asset(
                      doctor.imageAsset,
                      width: 58,
                      height: 58,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.person,
                        size: 58,
                      ),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    doctor.specialty,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    doctor.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}