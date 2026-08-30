import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/doctor_bloc/doctor_bloc.dart';
import '../../../bloc/doctor_bloc/doctor_event.dart';
import '../../../bloc/doctor_bloc/doctor_state.dart';
import '../../../core/constants/app_theme_extension.dart';
import '../../../shared/back_app_bar.dart';
import '../../doctor/widget/dr_recommendation_widget.dart';
import '../../../shared/custom_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<DoctorBloc>().add(const GetDoctorsEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const BackAppBar(
          appBarTitle: "Search Doctor",
          showBackButton: false,
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: width * 0.04,
            right: width * 0.04,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSearchBar(
                  controller: _searchController,
                  onChanged: (value) {
                    final query = value.trim();
                    if (query.isEmpty) {
                      context.read<DoctorBloc>().add(const GetDoctorsEvent());
                    } else {
                      context.read<DoctorBloc>().add(
                            SearchDoctorsEvent(name: query),
                          );
                    }
                  },
                ),
                Gap(height * 0.015),
                BlocBuilder<DoctorBloc, DoctorState>(
                  builder: (context, state) {
                    if (state is DoctorLoading) {
                      return const Padding(
                        padding: EdgeInsets.all(32),
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is DoctorError) {
                      return Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const Text(
                              'Unable to load doctors',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              state.message,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<DoctorBloc>().add(
                                      const GetDoctorsEvent(),
                                    );
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }

                    if (state is DoctorLoaded) {
                      if (state.doctors.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(24),
                          child: Text('No doctors found'),
                        );
                      }
                      return DrRecommendationWidget(doctors: state.doctors);
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
