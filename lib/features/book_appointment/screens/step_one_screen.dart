import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../widgets/appointment_type.dart';
import '../widgets/day_selector.dart';
import '../widgets/select_time.dart';


class StepOneScreen extends StatefulWidget {
  const StepOneScreen({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onDateSelected,
    required this.onTimeSelected,
    required this.selectedAppointmentType,
    required this.onAppointmentTypeSelected,
  });

  final DateTime selectedDate;
  final String? selectedTime;
  final ValueChanged<DateTime> onDateSelected;
  final ValueChanged<String> onTimeSelected;
  final String selectedAppointmentType;
  final ValueChanged<String> onAppointmentTypeSelected;

  @override
  State<StepOneScreen> createState() => _StepOneScreenState();
}

class _StepOneScreenState extends State<StepOneScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(height * 0.03),
          DateSelector(
            dates: List.generate(
              14,
                  (i) => DateTime.now().add(Duration(days: i)),
            ),
            selectedDate: widget.selectedDate,
            onDateSelected: widget.onDateSelected,
            onSetManual: () {},
          ),
          Gap(height * 0.04),
          TimeSlotSelector(
            times: const [
              "08:00 AM",
              "08:30 AM",
              "09:00 AM",
              "09:30 AM",
              "10:00 AM",
              "11:00 AM",
            ],
            selectedTime: widget.selectedTime,
            onTimeSelected: widget.onTimeSelected,
          ),
          Gap(height * 0.015),

          AppointmentTypeWidget(
            initialType: widget.selectedAppointmentType,
            onChanged: widget.onAppointmentTypeSelected,
          ),
        ],
      ),
    );
  }
}