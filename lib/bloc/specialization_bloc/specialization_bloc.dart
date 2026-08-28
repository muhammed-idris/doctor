import 'package:doctor/bloc/specialization_bloc/specialization_event.dart';
import 'package:doctor/bloc/specialization_bloc/specialization_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/specialization_model/specialization_repo.dart';

class SpecializationBloc
    extends Bloc<SpecializationEvent, SpecializationState> {

  final SpecializationRepository repository;

  SpecializationBloc(this.repository)
      : super(SpecializationInitial()) {

    on<GetAllSpecializations>(_getAllSpecializations);
    on<GetSpecializationDoctors>(_getSpecializationDoctors);
  }

  Future<void> _getAllSpecializations(
      GetAllSpecializations event,
      Emitter<SpecializationState> emit,
      ) async {
    emit(SpecializationLoading());

    try {
      final specializations =
      await repository.getAllSpecializations();

      emit(SpecializationsSuccess(specializations));
    } catch (e) {
      emit(SpecializationFailure(e.toString()));
    }
  }

  Future<void> _getSpecializationDoctors(
      GetSpecializationDoctors event,
      Emitter<SpecializationState> emit,
      ) async {
    emit(SpecializationLoading());

    try {
      final doctors = await repository.getDoctorsBySpecialization(
        event.specializationId,
      );

      emit(SpecializationDoctorsSuccess(doctors));
    } catch (e) {
      emit(SpecializationFailure(e.toString()));
    }
  }
}