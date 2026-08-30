import 'package:doctor/bloc/specialization_bloc/specialization_bloc.dart';
import 'package:doctor/features/home/screens/doctor_by_speciality_screen.dart';
import 'package:doctor/features/home/widget/doctor_speciality_widget.dart';
import 'package:doctor/features/home/widget/nearby_widget.dart';
import 'package:doctor/features/doctor/screen/dr_recommendation_screen.dart';
import 'package:doctor/features/doctor/widget/dr_recommendation_card.dart';
import 'package:doctor/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../bloc/doctor_bloc/doctor_bloc.dart';
import '../../../bloc/doctor_bloc/doctor_event.dart';
import '../../../bloc/doctor_bloc/doctor_state.dart';
import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/color_manger.dart';
import '../../../core/constants/text_styles.dart';
import 'doctor_speciality.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Load doctors when HomeScreen opens
    context.read<DoctorBloc>().add(const GetDoctorsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Scaffold(
      appBar: CustomAppBar(title: 'User'),

      body: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),

        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==================================================
              // Nearby
              // ==================================================
              const Gap(30),

              NearbyWidget(),

              Gap(height * 0.01),

              // ==================================================
              // Doctor Speciality Title
              // ==================================================
              Row(
                children: [
                  Text(
                    "Doctor Speciality",
                    style: TextStyles.appBar.copyWith(color: AppColors.black),
                  ),

                  const Spacer(),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorSpecialityScreen(),
                        ),
                      );
                    },

                    child: Text(
                      "See All",

                      style: TextStyles.headline2.copyWith(
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(height * 0.015),

              // ==================================================
              // Doctor Specialities
              // ==================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  // ---------------- General ----------------
                  DoctorSpecialityWidget(
                    id: 1,

                    title: "General",

                    imageLink: "assets/speciality/Man Doctor Europe 1.png",

                    onTap: () {
                      _openDoctors(context, id: 1, name: "General");
                    },
                  ),

                  // ---------------- Neurologic ----------------
                  DoctorSpecialityWidget(
                    id: 2,

                    title: "Neurologic",

                    imageLink: "assets/speciality/Brain 1.png",

                    onTap: () {
                      _openDoctors(context, id: 2, name: "Neurologic");
                    },
                  ),

                  DoctorSpecialityWidget(
                    id: 3,

                    title: "Pediatric",

                    imageLink: "assets/speciality/Iamge.png",

                    onTap: () {
                      _openDoctors(context, id: 3, name: "Pediatric");
                    },
                  ),

                  DoctorSpecialityWidget(
                    id: 4,

                    title: "Radiology",

                    imageLink: "assets/speciality/Kidneys 1.png",

                    onTap: () {
                      _openDoctors(context, id: 4, name: "Radiology");
                    },
                  ),
                ],
              ),

              Gap(height * 0.015),


              Row(
                children: [
                  Text(
                    "Recommendation Doctor",

                    style: TextStyles.appBar.copyWith(color: glass.textPrimary),
                  ),

                  const Spacer(),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DrRecommendationScreen(),
                        ),
                      );
                    },

                    child: Text(
                      "See All",

                      style: TextStyles.headline2.copyWith(
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(height * 0.01),


              BlocBuilder<DoctorBloc, DoctorState>(
                builder: (context, state) {

                  if (state is DoctorLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }


                  if (state is DoctorLoaded) {
                    if (state.doctors.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: Text("No doctors found")),
                      );
                    }

                    final doctors = state.doctors.take(4).toList();

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

                  // ---------------- Error ----------------

                  if (state is DoctorError) {
                    return Padding(
                      padding: const EdgeInsets.all(20),

                      child: Column(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 40,
                            color: Colors.red,
                          ),

                          const Gap(10),

                          const Text("Failed to load doctors"),

                          const Gap(10),

                          Text(
                            state.message,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const Gap(15),

                          ElevatedButton(
                            onPressed: () {
                              context.read<DoctorBloc>().add(
                                const GetDoctorsEvent(),
                              );
                            },

                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),

              Gap(height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // OPEN DOCTORS BY SPECIALIZATION
  // ============================================================

  void _openDoctors(
    BuildContext context, {
    required int id,
    required String name,
  }) {
    Navigator.push(
      context,

      MaterialPageRoute(
        builder: (context) {
          return BlocProvider.value(
            value: context.read<SpecializationBloc>(),

            child: DoctorsBySpecializationScreen(
              specializationId: id,
              specializationName: name,
            ),
          );
        },
      ),
    );
  }
}
