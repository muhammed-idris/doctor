import 'package:equatable/equatable.dart';

abstract class DoctorEvent extends Equatable {
  const DoctorEvent();

  @override
  List<Object?> get props => [];
}

// ================= GET ALL DOCTORS =================

class GetDoctorsEvent extends DoctorEvent {
  const GetDoctorsEvent();
}

// ================= GET DOCTOR BY ID =================

class GetDoctorByIdEvent extends DoctorEvent {
  final int doctorId;

  const GetDoctorByIdEvent({required this.doctorId});

  @override
  List<Object?> get props => [doctorId];
}

// ================= SEARCH DOCTORS =================

class SearchDoctorsEvent extends DoctorEvent {
  final String name;

  const SearchDoctorsEvent({required this.name});

  @override
  List<Object?> get props => [name];
}

// ================= FILTER BY CITY =================

class GetDoctorsByCityEvent extends DoctorEvent {
  final int cityId;

  const GetDoctorsByCityEvent({required this.cityId});

  @override
  List<Object?> get props => [cityId];
}