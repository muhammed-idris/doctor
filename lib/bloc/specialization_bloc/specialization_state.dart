import '../../data/models/doctor_model/doctor_specialization.dart';

abstract class SpecializationState {}

class SpecializationInitial extends SpecializationState {}

class SpecializationLoading extends SpecializationState {}

class SpecializationsSuccess extends SpecializationState {
  final List<SpecializationModel> specializations;

  SpecializationsSuccess(this.specializations);
}

class SpecializationSuccess extends SpecializationState {
  final SpecializationModel specialization;

  SpecializationSuccess(this.specialization);
}

class SpecializationFailure extends SpecializationState {
  final String message;

  SpecializationFailure(this.message);
}