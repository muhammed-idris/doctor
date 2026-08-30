import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/repos/doctor_repo.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRepository repository;

  DoctorBloc({required this.repository}) : super(DoctorInitial()) {
    on<GetDoctorsEvent>(_onGetDoctors);
    on<GetDoctorByIdEvent>(_onGetDoctorById);
    on<SearchDoctorsEvent>(_onSearchDoctors);
    on<GetDoctorsByCityEvent>(_onGetDoctorsByCity);
  }

  // ================= GET ALL DOCTORS =================

  Future<void> _onGetDoctors(
      GetDoctorsEvent event,
      Emitter<DoctorState> emit,
      ) {
    return _fetch(
      emit: emit,
      request: repository.getDoctors,
      onSuccess: (doctors) => DoctorLoaded(doctors: doctors),
    );
  }

  // ================= GET DOCTOR BY ID =================

  Future<void> _onGetDoctorById(
      GetDoctorByIdEvent event,
      Emitter<DoctorState> emit,
      ) {
    return _fetch(
      emit: emit,
      request: () => repository.getDoctorById(event.doctorId),
      onSuccess: (doctor) => DoctorDetailsLoaded(doctor: doctor),
    );
  }

  // ================= SEARCH DOCTORS =================

  Future<void> _onSearchDoctors(
      SearchDoctorsEvent event,
      Emitter<DoctorState> emit,
      ) {
    return _fetch(
      emit: emit,
      request: () => repository.searchDoctors(event.name),
      onSuccess: (doctors) => DoctorLoaded(doctors: doctors),
    );
  }

  // ================= FILTER BY CITY =================

  Future<void> _onGetDoctorsByCity(
      GetDoctorsByCityEvent event,
      Emitter<DoctorState> emit,
      ) {
    return _fetch(
      emit: emit,
      request: () => repository.getDoctorsByCity(event.cityId),
      onSuccess: (doctors) => DoctorLoaded(doctors: doctors),
    );
  }

  // ================= SHARED REQUEST HANDLER =================


  Future<void> _fetch<T>({
    required Emitter<DoctorState> emit,
    required Future<T> Function() request,
    required DoctorState Function(T data) onSuccess,
  }) async {
    emit(DoctorLoading());

    try {
      final data = await request();
      emit(onSuccess(data));
    } catch (e) {
      emit(DoctorError(message: e.toString()));
    }
  }
}