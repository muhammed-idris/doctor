import 'package:doctor/shared/back_app_bar.dart';
import 'package:doctor/shared/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/doctor_bloc/doctor_bloc.dart';
import '../../../bloc/doctor_bloc/doctor_event.dart';
import '../../../bloc/doctor_bloc/doctor_state.dart';
import '../../../core/constants/app_theme_extension.dart';
import '../widget/dr_recommendation_widget.dart';

class DrRecommendationScreen extends StatefulWidget {
  const DrRecommendationScreen({super.key});

  @override
  State<DrRecommendationScreen> createState() =>
      _DrRecommendationScreenState();
}

class _DrRecommendationScreenState extends State<DrRecommendationScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Load all doctors when screen opens
    context.read<DoctorBloc>().add(const GetDoctorsEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchDoctors(String value) {
    final query = value.trim();

    if (query.isEmpty) {
      // If search is empty, show all doctors again
      context.read<DoctorBloc>().add(const GetDoctorsEvent());
    } else {
      // Search doctors by name
      context.read<DoctorBloc>().add(
        SearchDoctorsEvent(name: query),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass =
        Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: BackAppBar(
          appBarTitle: "Recommendation Doctor",
          button: Icon(
            Icons.more_horiz_rounded,
            color: glass.textPrimary,
            size: 24,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: height * 0.03,
            left: width * 0.04,
            right: width * 0.04,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomSearchBar(
                  controller: _searchController,
                  onChanged: _searchDoctors,
                ),

                Gap(height * 0.015),

                BlocBuilder<DoctorBloc, DoctorState>(
                  builder: (context, state) {
                    // Loading
                    if (state is DoctorLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(32),
                        child: CircularProgressIndicator(),
                      );
                    }

                    // Error
                    if (state is DoctorError) {
                      return Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const Text(
                              "Something went wrong",
                              textAlign: TextAlign.center,
                            ),

                            const Gap(10),

                            Text(
                              state.message,
                              textAlign: TextAlign.center,
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

                    // Success
                    if (state is DoctorLoaded) {
                      if (state.doctors.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(30),
                          child: Text(
                            "No doctors found",
                            textAlign: TextAlign.center,
                          ),
                        );
                      }

                      return DrRecommendationWidget(
                        doctors: state.doctors,
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}