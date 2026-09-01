import 'package:equatable/equatable.dart';

import '../../../data/models/appointment_model/appointment_model.dart';
import '../../features/book_appointment/widgets/appointment_type.dart';
import '../../features/book_appointment/widgets/payment_method.dart';

abstract class AppointmentState extends Equatable {
  const AppointmentState({
    required this.currentStep,
    required this.selectedDate,
    required this.selectedTime,
    required this.appointmentType,
    required this.paymentSelection,
  });

  final int currentStep;
  final DateTime selectedDate;
  final String? selectedTime;
  final String appointmentType;
  final PaymentSelection paymentSelection;

  bool get canProceedFromCurrentStep {
    switch (currentStep) {
      case 0:
        return selectedTime != null;
      default:
        return true;
    }
  }

  @override
  List<Object?> get props => [
    currentStep,
    selectedDate,
    selectedTime,
    appointmentType,
    paymentSelection,
  ];
}

class AppointmentInitial extends AppointmentState {
  AppointmentInitial()
      : super(
    currentStep: 0,
    selectedDate: DateTime.now(),
    selectedTime: null,
    appointmentType: AppointmentTypeKeys.inPerson,
    paymentSelection: const PaymentSelection(
      method: 'credit_card',
      cardId: 'master_card',
    ),
  );
}

/// Emitted after any selection (date, time, type, payment, step) changes.
class AppointmentUpdated extends AppointmentState {
  const AppointmentUpdated({
    required super.currentStep,
    required super.selectedDate,
    required super.selectedTime,
    required super.appointmentType,
    required super.paymentSelection,
  });
}

class AppointmentSubmitting extends AppointmentState {
  const AppointmentSubmitting({
    required super.currentStep,
    required super.selectedDate,
    required super.selectedTime,
    required super.appointmentType,
    required super.paymentSelection,
  });
}

class AppointmentBooked extends AppointmentState {
  const AppointmentBooked(
      this.appointment, {
        required super.currentStep,
        required super.selectedDate,
        required super.selectedTime,
        required super.appointmentType,
        required super.paymentSelection,
      });

  final AppointmentModel appointment;

  @override
  List<Object?> get props => [...super.props, appointment];
}

class AppointmentSubmissionFailed extends AppointmentState {
  const AppointmentSubmissionFailed(
      this.message, {
        required super.currentStep,
        required super.selectedDate,
        required super.selectedTime,
        required super.appointmentType,
        required super.paymentSelection,
      });

  final String message;

  @override
  List<Object?> get props => [...super.props, message];
}