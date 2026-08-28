import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/specialization_model/specialization_repo.dart';
import 'specialization_event.dart';
import 'specialization_state.dart';

class SpecializationBloc
    extends Bloc<SpecializationEvent, SpecializationState> {

  final SpecializationRepository repository;

  SpecializationBloc(this.repository)
      : super(SpecializationInitial()) {

    on<GetAllSpecializations>(_getAllSpecializations);
    on<GetSpecialization>(_getSpecialization);
  }

  Future<void> _getAllSpecializations(
      GetAllSpecializations event,
      Emitter<SpecializationState> emit,
      ) async {
    emit(SpecializationLoading());

    try {
      final specializations =
      await repository.getAllSpecializations();

      emit(
        SpecializationsSuccess(specializations),
      );
    } catch (e) {
      emit(
        SpecializationFailure(e.toString()),
      );
    }
  }

  Future<void> _getSpecialization(
      GetSpecialization event,
      Emitter<SpecializationState> emit,
      ) async {
    emit(SpecializationLoading());

    try {
      final specialization =
      await repository.getSpecialization(event.id);

      emit(
        SpecializationSuccess(specialization),
      );
    } catch (e) {
      emit(
        SpecializationFailure(e.toString()),
      );
    }
  }
}