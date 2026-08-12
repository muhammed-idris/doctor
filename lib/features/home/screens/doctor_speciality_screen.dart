import 'package:doctor/shared/back_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/image_manger.dart';
import '../widget/doctor_speciality_widget.dart';

class DoctorSpecialityScreen extends StatefulWidget {
  const DoctorSpecialityScreen({super.key});

  @override
  State<DoctorSpecialityScreen> createState() => _DoctorSpecialityScreenState();
}

class _DoctorSpecialityScreenState extends State<DoctorSpecialityScreen> {
  final List<Map<String, String>> specialities = const [
    {'title': 'General', 'imageLink': AssetsManager.general},
    {'title': 'ENT', 'imageLink': AssetsManager.ent},
    {'title': 'Pediatric', 'imageLink': AssetsManager.pediatric},
    {'title': 'Urologist', 'imageLink': AssetsManager.urologist},
    {'title': 'Dentistry', 'imageLink': AssetsManager.dentistry},
    {'title': 'Intestine', 'imageLink': AssetsManager.intestine},
    {'title': 'Histologist', 'imageLink': AssetsManager.histologist},
    {'title': 'Hepatology', 'imageLink': AssetsManager.hepatology},
    {'title': 'Cardiologist', 'imageLink': AssetsManager.cardiologist},
    {'title': 'Neurologic', 'imageLink': AssetsManager.neurologic},
    {'title': 'Pulmonary', 'imageLink': AssetsManager.pulmonary},
    {'title': 'Optometry', 'imageLink': AssetsManager.optometry},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const BackAppBar(appBarTitle: "Doctor Speciality"),
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.03,
          left: width * 0.04,
          right: width * 0.04,
        ),
        child: GridView.builder(
          padding: EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
          itemCount: specialities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 4,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final speciality = specialities[index];
            return DoctorSpecialityWidget(
              title: speciality['title']!,
              imageLink: speciality['imageLink']!,
            );
          },
        ),
      ),
    );
  }
}
