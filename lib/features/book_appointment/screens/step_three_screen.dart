import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/custom_container.dart';
import '../../doctor/model/doctor_model.dart';
import '../widgets/appointment_type.dart';
import '../widgets/payment_method.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.appointmentType,
    required this.paymentSelection,
    required this.onChangePayment,
    this.doctor = DoctorInfo.placeholder,
    this.subtotal = 4694,
    this.tax = 250,
  });

  final DateTime selectedDate;
  final String? selectedTime;
  final String appointmentType;
  final PaymentSelection paymentSelection;
  final VoidCallback onChangePayment;
  final DoctorInfo doctor;
  final double subtotal;
  final double tax;

  double get _total => subtotal + tax;

  String _formatCurrency(double value) {
    final formatted = value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 2);
    return '\$$formatted';
  }

  ({IconData icon, String title, String subtitle}) _paymentDisplay() {
    switch (paymentSelection.method) {
      case 'credit_card':
        final isAmex = paymentSelection.cardId == 'american_express';
        return (
        icon: Icons.credit_card_rounded,
        title: isAmex ? 'American Express' : 'Master Card',
        subtitle: '•••• •••• •••• 3782',
        );
      case 'bank_transfer':
        return (
        icon: Icons.account_balance_outlined,
        title: 'Bank Transfer',
        subtitle: 'Direct bank transfer',
        );
      case 'paypal':
        return (
        icon: Icons.account_balance_wallet_outlined,
        title: 'Paypal',
        subtitle: '•••• •••• •••• 3782',
        );
      default:
        return (
        icon: Icons.payment_outlined,
        title: paymentSelection.method,
        subtitle: '',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;
    final payment = _paymentDisplay();

    final formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(selectedDate);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(height * 0.02),
          _SectionTitle(title: 'Booking Information', glass: glass),
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
                _SummaryRow(
                  icon: Icons.calendar_today_rounded,
                  iconColor: Colors.blue,
                  label: 'Date & Time',
                  value: formattedDate,
                  secondaryValue: selectedTime,
                  glass: glass,
                  showDivider: true,
                ),
                _SummaryRow(
                  icon: Icons.assignment_outlined,
                  iconColor: Colors.green,
                  label: 'Appointment Type',
                  value: AppointmentTypeKeys.labelFor(appointmentType),
                  glass: glass,
                  showDivider: false,
                ),
              ],
            ),
          ),
          Gap(height * 0.025),
          _SectionTitle(title: 'Doctor Information', glass: glass),
          Gap(height * 0.01),
          DoctorInfoCard(doctor: doctor),
          Gap(height * 0.025),
          _SectionTitle(title: 'Payment Information', glass: glass),
          Gap(height * 0.01),
          CustomGlassCard(
            width: width,
            borderRadius: 20,
            blur: 20,
            borderWidth: 1,
            borderColors: glass.borderColors,
            backgroundColor: glass.background,
            child: Row(
              children: [
                Container(
                  width: width * 0.11,
                  height: width * 0.11,
                  decoration: BoxDecoration(
                    color: glass.primaryBlue.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Icon(payment.icon, color: glass.primaryBlue, size: width * 0.06),
                ),
                Gap(width * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        payment.title,
                        style: TextStyles.bodySmall.copyWith(
                          color: glass.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (payment.subtitle.isNotEmpty) ...[
                        const Gap(2),
                        Text(
                          payment.subtitle,
                          style: TextStyles.bodySmall.copyWith(color: glass.hintText),
                        ),
                      ],
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: onChangePayment,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    side: BorderSide(color: glass.primaryBlue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Change',
                    style: TextStyles.bodySmall.copyWith(
                      color: glass.primaryBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(height * 0.025),
          _SectionTitle(title: 'Payment Info', glass: glass),
          Gap(height * 0.01),
          CustomGlassCard(
            width: width,
            borderRadius: 20,
            blur: 20,
            borderWidth: 1,
            borderColors: glass.borderColors,
            backgroundColor: glass.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PriceRow(label: 'Subtotal', value: _formatCurrency(subtotal), glass: glass),
                Gap(height * 0.01),
                _PriceRow(label: 'Tax', value: _formatCurrency(tax), glass: glass),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.012),
                  child: Divider(color: glass.hintText.withValues(alpha: 0.25), height: 1),
                ),
                _PriceRow(
                  label: 'Payment Total',
                  value: _formatCurrency(_total),
                  glass: glass,
                  emphasize: true,
                ),
              ],
            ),
          ),
          Gap(height * 0.02),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.glass});

  final String title;
  final GlassTheme glass;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.headline1.copyWith(
        color: glass.textPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    required this.glass,
    required this.showDivider,
    this.secondaryValue,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final String? secondaryValue;
  final GlassTheme glass;
  final bool showDivider;

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
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  const _PriceRow({
    required this.label,
    required this.value,
    required this.glass,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final GlassTheme glass;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final style = emphasize
        ? TextStyles.headline2.copyWith(color: glass.textPrimary, fontWeight: FontWeight.w700)
        : TextStyles.bodySmall.copyWith(color: glass.hintText);
    final valueStyle = emphasize
        ? TextStyles.headline2.copyWith(color: glass.textPrimary, fontWeight: FontWeight.w700)
        : TextStyles.bodySmall.copyWith(color: glass.textPrimary, fontWeight: FontWeight.w600);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(value, style: valueStyle),
      ],
    );
  }
}