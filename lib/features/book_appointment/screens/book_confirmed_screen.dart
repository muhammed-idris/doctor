import 'package:doctor/root/root.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/back_app_bar.dart';
import '../../../shared/custom_container.dart';
import '../../doctor/model/dr_model.dart';
import '../widgets/appointment_type.dart';

class BookingConfirmedScreen extends StatelessWidget {
  const BookingConfirmedScreen({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.appointmentType,
    this.doctor = DoctorInfo.placeholder,
    this.onGetLocation,
    this.onDone,
  });

  final DateTime selectedDate;
  final String? selectedTime;
  final String appointmentType;
  final DoctorInfo doctor;
  final VoidCallback? onGetLocation;

  /// Called when the user taps "Done". Defaults to popping every route
  /// pushed on top of the booking flow's starting screen.
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    final formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(selectedDate);
    final isInPerson = appointmentType == AppointmentTypeKeys.inPerson;

    return Scaffold(
      appBar: const BackAppBar(appBarTitle: "Details"),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(height * 0.04),
                      Container(
                        width: width * 0.18,
                        height: width * 0.18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF2ECC71),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: width * 0.1,
                        ),
                      ),
                      Gap(height * 0.02),
                      Text(
                        'Booking Confirmed',
                        style: TextStyles.headline1.copyWith(
                          color: glass.textPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      Gap(height * 0.035),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Booking Information',
                          style: TextStyles.headline1.copyWith(
                            color: glass.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Gap(height * 0.01),
                      CustomGlassCard(
                        width: width,
                        padding: EdgeInsets.zero,
                        borderRadius: 20,
                        blur: 20,
                        borderWidth: 1,
                        borderColors: glass.borderColors,
                        backgroundColor: glass.background,
                        child: Column(
                          children: [
                            _InfoRow(
                              icon: Icons.calendar_today_rounded,
                              iconColor: Colors.blue,
                              label: 'Date & Time',
                              value: formattedDate,
                              secondaryValue: selectedTime,
                              glass: glass,
                              showDivider: true,
                            ),
                            _InfoRow(
                              icon: Icons.assignment_outlined,
                              iconColor: Colors.green,
                              label: 'Appointment Type',
                              value: AppointmentTypeKeys.labelFor(appointmentType),
                              glass: glass,
                              showDivider: false,
                              trailing: isInPerson
                                  ? OutlinedButton(
                                onPressed: onGetLocation,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  side: BorderSide(color: glass.primaryBlue),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Get Location',
                                  style: TextStyles.bodySmall.copyWith(
                                    color: glass.primaryBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      Gap(height * 0.03),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Doctor Information',
                          style: TextStyles.headline1.copyWith(
                            color: glass.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Gap(height * 0.01),
                      DoctorInfoCard(doctor: doctor),
                      Gap(height * 0.02),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: onDone ??
                            () => Navigator.pushReplacement(context, MaterialPageRoute(builder:
                            (context) => Root(),)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: glass.primaryBlue,
                      padding: EdgeInsets.symmetric(vertical: height * 0.018),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyles.headline2.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.glass,
    required this.showDivider,
    this.secondaryValue,
    this.trailing,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final String? secondaryValue;
  final GlassTheme glass;
  final bool showDivider;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.014),
      decoration: showDivider
          ? BoxDecoration(
        border: Border(
          bottom: BorderSide(color: glass.hintText.withValues(alpha: 0.2), width: 0.6),
        ),
      )
          : null,
      child: Row(
        children: [
          Container(
            width: width * 0.09,
            height: width * 0.09,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Icon(icon, color: iconColor, size: width * 0.05),
          ),
          Gap(width * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyles.bodySmall.copyWith(
                    color: glass.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(2),
                Text(
                  value,
                  style: TextStyles.bodySmall.copyWith(color: glass.hintText),
                ),
                if (secondaryValue != null)
                  Text(
                    secondaryValue!,
                    style: TextStyles.bodySmall.copyWith(color: glass.hintText),
                  ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}