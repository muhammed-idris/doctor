import 'package:equatable/equatable.dart';

import '../../data/models/doctor_model/doctor_model.dart';

/// Base class for all states emitted by [DoctorBloc].
abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object?> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<DoctorModel> doctors;

  const DoctorLoaded({required this.doctors});

  @override
  List<Object?> get props => [doctors];
}

class DoctorDetailsLoaded extends DoctorState {
  final DoctorModel doctor;

  const DoctorDetailsLoaded({required this.doctor});

  @override
  List<Object?> get props => [doctor];
}

class DoctorError extends DoctorState {
  final String message;

  const DoctorError({required this.message});

  @override
  List<Object?> get props => [message];
}