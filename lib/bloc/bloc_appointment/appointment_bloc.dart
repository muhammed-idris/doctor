import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/repos/appointment_repo.dart';
import '../../features/book_appointment/widgets/payment_method.dart';
import 'appointment_event.dart';
import 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final AppointmentRepository appointmentRepository;

  AppointmentBloc({
    required this.appointmentRepository,
  }) : super(AppointmentInitial()) {
    on<AppointmentDateSelected>(_onDateSelected);
    on<AppointmentTimeSelected>(_onTimeSelected);
    on<AppointmentTypeSelected>(_onTypeSelected);
    on<AppointmentPaymentSelected>(_onPaymentSelected);
    on<AppointmentStepChanged>(_onStepChanged);
    on<AppointmentSubmitRequested>(_onSubmitRequested);
  }

  // ================= DATE =================

  void _onDateSelected(
      AppointmentDateSelected event,
      Emitter<AppointmentState> emit,
      ) {
    emit(_updated(selectedDate: event.date));
  }

  // ================= TIME =================

  void _onTimeSelected(
      AppointmentTimeSelected event,
      Emitter<AppointmentState> emit,
      ) {
    emit(_updated(selectedTime: event.time));
  }

  // ================= TYPE =================

  void _onTypeSelected(
      AppointmentTypeSelected event,
      Emitter<AppointmentState> emit,
      ) {
    emit(_updated(appointmentType: event.type));
  }

  // ================= PAYMENT =================

  void _onPaymentSelected(
      AppointmentPaymentSelected event,
      Emitter<AppointmentState> emit,
      ) {
    emit(_updated(paymentSelection: event.payment));
  }

  // ================= STEP =================

  void _onStepChanged(
      AppointmentStepChanged event,
      Emitter<AppointmentState> emit,
      ) {
    emit(_updated(currentStep: event.step));
  }

  // ================= SUBMIT =================

  Future<void> _onSubmitRequested(
      AppointmentSubmitRequested event,
      Emitter<AppointmentState> emit,
      ) async {
    final current = state;
    if (current.selectedTime == null) return;

    emit(AppointmentSubmitting(
      currentStep: current.currentStep,
      selectedDate: current.selectedDate,
      selectedTime: current.selectedTime,
      appointmentType: current.appointmentType,
      paymentSelection: current.paymentSelection,
    ));

    try {
      final appointment = await appointmentRepository.bookAppointment(
        doctorId: event.doctorId,
        date: current.selectedDate,
        time: current.selectedTime!,
        appointmentType: current.appointmentType,
        paymentSelection: current.paymentSelection,
      );

      emit(AppointmentBooked(
        appointment,
        currentStep: current.currentStep,
        selectedDate: current.selectedDate,
        selectedTime: current.selectedTime,
        appointmentType: current.appointmentType,
        paymentSelection: current.paymentSelection,
      ));
    } catch (e) {
      emit(AppointmentSubmissionFailed(
        e.toString().replaceFirst('Exception: ', ''),
        currentStep: current.currentStep,
        selectedDate: current.selectedDate,
        selectedTime: current.selectedTime,
        appointmentType: current.appointmentType,
        paymentSelection: current.paymentSelection,
      ));
    }
  }


  AppointmentUpdated _updated({
    int? currentStep,
    DateTime? selectedDate,
    String? selectedTime,
    String? appointmentType,
    PaymentSelection? paymentSelection,
  }) {
    return AppointmentUpdated(
      currentStep: currentStep ?? state.currentStep,
      selectedDate: selectedDate ?? state.selectedDate,
      selectedTime: selectedTime ?? state.selectedTime,
      appointmentType: appointmentType ?? state.appointmentType,
      paymentSelection: paymentSelection ?? state.paymentSelection,
    );
  }
}