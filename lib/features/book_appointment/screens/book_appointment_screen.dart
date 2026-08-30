import 'package:doctor/features/book_appointment/screens/step_one_screen.dart';
import 'package:doctor/features/book_appointment/screens/step_three_screen.dart';
import 'package:doctor/features/book_appointment/screens/step_two_screen.dart';
import 'package:doctor/features/doctor/model/dr_model.dart';
import 'package:doctor/shared/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_theme_extension.dart';
import '../../../core/constants/text_styles.dart';
import '../../../shared/custom_snack_bar.dart';
import '../widgets/appointment_steps.dart';
import '../widgets/appointment_type.dart';
import '../widgets/payment_method.dart';
import 'book_confirmed_screen.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({
    super.key,
    this.doctor = DoctorInfo.placeholder,
  });

  final DoctorInfo doctor;

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  static const List<String> _steps = ["Date & Time", "Payment", "Summary"];

  final PageController _pageController = PageController();

  int currentStep = 0;
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  String appointmentType = AppointmentTypeKeys.inPerson;
  PaymentSelection paymentSelection =
  const PaymentSelection(method: 'credit_card', cardId: 'master_card');

  /// Whether the user is allowed to move forward from the current step.
  bool get _canProceed {
    switch (currentStep) {
      case 0:
        return selectedTime != null;
      default:
        return true;
    }
  }

  void _goToStep(int step) {
    setState(() => currentStep = step);
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onNext() {
    if (!_canProceed) return;

    if (currentStep == _steps.length - 1) {
      _confirmBooking();
      return;
    }
    _goToStep(currentStep + 1);
  }

  void _onBack() {
    if (currentStep == 0) return;
    _goToStep(currentStep - 1);
  }

  void _confirmBooking() {
    AppSnackbar.showSuccess(context, "Appointment booked!");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingConfirmedScreen(
          doctor: widget.doctor,
          selectedDate: selectedDate,
          selectedTime: selectedTime,
          appointmentType: appointmentType,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final glass = Theme.of(context).extension<GlassTheme>() ?? GlassTheme.light;

    return Scaffold(
      appBar: BackAppBar(appBarTitle: "Book Appointment"),
      body: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          top: height * 0.03,
        ),
        child: Column(
          children: [
            AppointmentStepper(
              currentStep: currentStep,
              steps: _steps,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,

                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() => currentStep = index);
                },
                children: [
                  StepOneScreen(
                    selectedDate: selectedDate,
                    selectedTime: selectedTime,
                    onDateSelected: (date) => setState(() => selectedDate = date),
                    onTimeSelected: (time) => setState(() => selectedTime = time),
                    selectedAppointmentType: appointmentType,
                    onAppointmentTypeSelected: (type) =>
                        setState(() => appointmentType = type),
                  ),
                  StepTwoScreen(
                    selectedPayment: paymentSelection,
                    onPaymentSelected: (selection) =>
                        setState(() => paymentSelection = selection),
                  ),
                  StepThreeScreen(
                    doctor: widget.doctor,
                    selectedDate: selectedDate,
                    selectedTime: selectedTime,
                    appointmentType: appointmentType,
                    paymentSelection: paymentSelection,
                    onChangePayment: () => _goToStep(1),
                  ),
                ],
              ),
            ),
            Gap(height * 0.01),
            _NavigationButtons(
              currentStep: currentStep,
              isLastStep: currentStep == _steps.length - 1,
              canProceed: _canProceed,
              glass: glass,
              onBack: _onBack,
              onNext: _onNext,
            ),
            Gap(height * 0.05),
          ],
        ),
      ),
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    required this.currentStep,
    required this.isLastStep,
    required this.canProceed,
    required this.glass,
    required this.onBack,
    required this.onNext,
  });

  final int currentStep;
  final bool isLastStep;
  final bool canProceed;
  final GlassTheme glass;
  final VoidCallback onBack;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        if (currentStep > 0) ...[
          Expanded(
            child: OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: height * 0.018),
                side: BorderSide(color: glass.primaryBlue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Back",
                style: TextStyles.headline2.copyWith(
                  color: glass.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Gap(12),
        ],
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: canProceed ? onNext : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: glass.primaryBlue,
              disabledBackgroundColor: glass.primaryBlue.withValues(alpha: 0.4),
              padding: EdgeInsets.symmetric(vertical: height * 0.018),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              isLastStep ? "Confirm" : "Next",
              style: TextStyles.headline2.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}