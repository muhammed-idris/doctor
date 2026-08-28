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
                  child: ListTile(
                    title: Text(doctor.name),
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