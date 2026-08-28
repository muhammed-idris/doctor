import 'package:doctor/bloc/specialization_bloc/specialization_bloc.dart';
import 'package:doctor/bloc/specialization_bloc/specialization_event.dart';
import 'package:doctor/bloc/specialization_bloc/specialization_state.dart';
import 'package:doctor/shared/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/image_manger.dart';
import '../widget/doctor_speciality_widget.dart';
import 'doctor_speciality_screen.dart';

class DoctorSpecialityScreen extends StatefulWidget {
  const DoctorSpecialityScreen({super.key});

  @override
  State<DoctorSpecialityScreen> createState() =>
      _DoctorSpecialityScreenState();
}

class _DoctorSpecialityScreenState
    extends State<DoctorSpecialityScreen> {

  @override
  void initState() {
    super.initState();

    context.read<SpecializationBloc>().add(
      GetAllSpecializations(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const BackAppBar(
        appBarTitle: "Doctor Speciality",
      ),

      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.03,
          left: width * 0.04,
          right: width * 0.04,
        ),

        child: BlocBuilder<SpecializationBloc, SpecializationState>(
          builder: (context, state) {

            // --------------------------------------------
            // Loading
            // --------------------------------------------

            if (state is SpecializationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            // --------------------------------------------
            // Error
            // --------------------------------------------

            if (state is SpecializationFailure) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 50,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 15),

                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<SpecializationBloc>()
                            .add(
                          GetAllSpecializations(),
                        );
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            // --------------------------------------------
            // Success
            // --------------------------------------------

            if (state is SpecializationsSuccess) {

              if (state.specializations.isEmpty) {
                return const Center(
                  child: Text(
                    "No specializations found",
                  ),
                );
              }

              return GridView.builder(
                padding: EdgeInsets.only(
                  top: height * 0.02,
                  bottom: height * 0.02,
                ),

                itemCount: state.specializations.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.9,
                ),

                itemBuilder: (context, index) {

                  final specialization =
                  state.specializations[index];

                  return DoctorSpecialityWidget(
                    id: specialization.id,
                    title: specialization.name,
                    imageLink: _getSpecializationImage(
                      specialization.name,
                    ),
                    onTap: () {
                      _openDoctors(
                        context,
                        specialization.id,
                        specialization.name,
                      );
                    },
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  // --------------------------------------------
  // Open Doctors Screen
  // --------------------------------------------

  void _openDoctors(
      BuildContext context,
      int specializationId,
      String specializationName,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BlocProvider.value(
            value: context.read<SpecializationBloc>(),
            child: DoctorsBySpecializationScreen(
              specializationId: specializationId,
              specializationName: specializationName,
            ),
          );
        },
      ),
    );
  }

  // --------------------------------------------
  // Specialization Images
  // --------------------------------------------

  String _getSpecializationImage(String name) {
    switch (name.toLowerCase()) {

      case 'general':
      case 'general medicine':
        return AssetsManager.general;

      case 'ent':
      case 'ear nose throat':
        return AssetsManager.ent;

      case 'pediatric':
      case 'pediatrics':
        return AssetsManager.pediatric;

      case 'urologist':
      case 'urology':
        return AssetsManager.urologist;

      case 'dentistry':
      case 'dentist':
        return AssetsManager.dentistry;

      case 'intestine':
        return AssetsManager.intestine;

      case 'histologist':
      case 'histology':
        return AssetsManager.histologist;

      case 'hepatology':
        return AssetsManager.hepatology;

      case 'cardiologist':
      case 'cardiology':
        return AssetsManager.cardiologist;

      case 'neurologic':
      case 'neurology':
        return AssetsManager.neurologic;

      case 'pulmonary':
      case 'pulmonology':
        return AssetsManager.pulmonary;

      case 'optometry':
        return AssetsManager.optometry;

      default:
        return AssetsManager.general;
    }
  }
}