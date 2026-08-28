import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/doctor_model/doctor_repo.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository repository;

  DoctorBloc({required this.repository}) : super(DoctorInitial()) {
    on<GetDoctorsEvent>(_getDoctors);

    on<GetDoctorByIdEvent>(_getDoctorById);

    on<SearchDoctorsEvent>(_searchDoctors);

    on<GetDoctorsByCityEvent>(_getDoctorsByCity);
  }

  Future<void> _getDoctors(
    GetDoctorsEvent event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());

    try {
      final doctors = await repository.getDoctors();

      emit(DoctorLoaded(doctors: doctors));
    } catch (e) {
      emit(DoctorError(message: e.toString()));
    }
  }

  Future<void> _getDoctorById(
    GetDoctorByIdEvent event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());

    try {
      final doctor = await repository.getDoctorById(event.doctorId);

      emit(DoctorDetailsLoaded(doctor: doctor));
    } catch (e) {
      emit(DoctorError(message: e.toString()));
    }
  }

  Future<void> _searchDoctors(
    SearchDoctorsEvent event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());

    try {
      final doctors = await repository.searchDoctors(event.name);

      emit(DoctorLoaded(doctors: doctors));
    } catch (e) {
      emit(DoctorError(message: e.toString()));
    }
  }

  Future<void> _getDoctorsByCity(
    GetDoctorsByCityEvent event,
    Emitter<DoctorState> emit,
  ) async {
    emit(DoctorLoading());

    try {
      final doctors = await repository.getDoctorsByCity(event.cityId);

      emit(DoctorLoaded(doctors: doctors));
    } catch (e) {
      emit(DoctorError(message: e.toString()));
    }
  }
}
