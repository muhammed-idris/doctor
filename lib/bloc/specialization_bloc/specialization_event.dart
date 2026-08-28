abstract class SpecializationEvent {}

class GetAllSpecializations extends SpecializationEvent {}

class GetSpecialization extends SpecializationEvent {
  final int id;

  GetSpecialization(this.id);
}