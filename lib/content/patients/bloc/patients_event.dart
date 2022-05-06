part of 'patients_bloc.dart';

abstract class PatientsEvent extends Equatable {
  const PatientsEvent();

  @override
  List<Object> get props => [];
}

class GetAllPatientsEvent extends PatientsEvent {}

class AddPatientEvent extends PatientsEvent {
  final Map<String, dynamic> newPatient;

  AddPatientEvent({required this.newPatient});

  @override
  List<Object> get props => [this.newPatient];
}
