import '../../features/book_appointment/widgets/payment_method.dart';

class AppointmentEvent {}

class AppointmentDateSelected extends AppointmentEvent {
  final DateTime date;

  AppointmentDateSelected({required this.date});
}

class AppointmentTimeSelected extends AppointmentEvent {
  final String time;

  AppointmentTimeSelected({required this.time});
}

class AppointmentTypeSelected extends AppointmentEvent {
  final String type;

  AppointmentTypeSelected({required this.type});
}

class AppointmentPaymentSelected extends AppointmentEvent {
  final PaymentSelection payment;

  AppointmentPaymentSelected({required this.payment});
}

class AppointmentStepChanged extends AppointmentEvent {
  final int step;

  AppointmentStepChanged({required this.step});
}

class AppointmentSubmitRequested extends AppointmentEvent {
  final int doctorId;

  AppointmentSubmitRequested({required this.doctorId});
}