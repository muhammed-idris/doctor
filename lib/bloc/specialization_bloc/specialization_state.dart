import '../../data/models/doctor_model/doctor_model.dart';
import '../../data/models/specialization_model/specialization_model.dart';

abstract class SpecializationState {}

class SpecializationInitial extends SpecializationState {}

class SpecializationLoading extends SpecializationState {}

class SpecializationsSuccess extends SpecializationState {
  final List<SpecializationModel> specializations;

  SpecializationsSuccess(this.specializations);
}

class SpecializationDoctorsSuccess extends SpecializationState {
  final List<DoctorModel> doctors;

  SpecializationDoctorsSuccess(this.doctors);
}

class SpecializationFailure extends SpecializationState {
  final String message;

  SpecializationFailure(this.message);
}