part of 'patients_bloc.dart';

abstract class PatientsState extends Equatable {
  const PatientsState();

  @override
  List<Object> get props => [];
}

class PatientsInitial extends PatientsState {}

class PatientsLoadingState extends PatientsState {}

class PatientsSuccessState extends PatientsState {
  final List<Patient> patients;

  PatientsSuccessState({required this.patients});
  @override
  List<Object> get props => [this.patients];
}

class PatientsErrorState extends PatientsState {}
