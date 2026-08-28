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
  State<DrRecommendationScreen> createState() => _DrRecommendationScreenState();
}

class _DrRecommendationScreenState extends State<DrRecommendationScreen> {
  @override
  void initState() {
    super.initState();

    context.read<DoctorBloc>().add(const GetDoctorsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

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
                const CustomSearchBar(),

                Gap(height * 0.015),

                BlocBuilder<DoctorBloc, DoctorState>(
                  builder: (context, state) {
                    // Loading
                    if (state is DoctorLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // Success
                    if (state is DoctorLoaded) {
                      if (state.doctors.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: Text("No doctors found"),
                          ),
                        );
                      }

                      return DrRecommendationWidget(doctors: state.doctors);
                    }

                    // Error
                    if (state is DoctorError) {
                      return Center(
                        child: Column(
                          children: [
                            const Text("Something went wrong"),

                            const Gap(10),

                            Text(state.message, textAlign: TextAlign.center),

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
