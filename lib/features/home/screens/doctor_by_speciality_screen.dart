import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/specialization_bloc/specialization_bloc.dart';
import '../../../bloc/specialization_bloc/specialization_event.dart';
import '../../../bloc/specialization_bloc/specialization_state.dart';
import '../../../shared/back_app_bar.dart';

class DoctorsBySpecializationScreen extends StatefulWidget {
  final int specializationId;
  final String specializationName;

  const DoctorsBySpecializationScreen({
    super.key,
    required this.specializationId,
    required this.specializationName,
  });

  @override
  State<DoctorsBySpecializationScreen> createState() =>
      _DoctorsBySpecializationScreenState();
}

class _DoctorsBySpecializationScreenState
    extends State<DoctorsBySpecializationScreen> {

  @override
  void initState() {
    super.initState();

    context.read<SpecializationBloc>().add(
      GetSpecializationDoctors(
        widget.specializationId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        appBarTitle: widget.specializationName,
      ),
      body: BlocBuilder<SpecializationBloc, SpecializationState>(
        builder: (context, state) {

          if (state is SpecializationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SpecializationFailure) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is SpecializationDoctorsSuccess) {
            if (state.doctors.isEmpty) {
              return const Center(
                child: Text('No doctors found'),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.doctors.length,
              itemBuilder: (context, index) {
                final doctor = state.doctors[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: doctor.photo.isNotEmpty
                              ? NetworkImage(doctor.photo)
                              : null,
                          child: doctor.photo.isEmpty
                              ? const Icon(Icons.person, size: 32)
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                doctor.degree.isNotEmpty
                                    ? '${doctor.degree} • ${doctor.specialization.name}'
                                    : doctor.specialization.name,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              if (doctor.city.name.isNotEmpty)
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined, size: 14),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        doctor.city.name,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              if (doctor.startTime.isNotEmpty && doctor.endTime.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.access_time, size: 14),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${doctor.startTime} - ${doctor.endTime}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${doctor.appointPrice}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'price',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}