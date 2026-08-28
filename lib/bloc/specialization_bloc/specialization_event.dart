abstract class SpecializationEvent {}

class GetAllSpecializations extends SpecializationEvent {}

class GetSpecializationDoctors extends SpecializationEvent {
  final int specializationId;

  GetSpecializationDoctors(this.specializationId);
}