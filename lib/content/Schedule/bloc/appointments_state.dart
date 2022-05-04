part of 'appointments_bloc.dart';

abstract class AppointmentsState extends Equatable {
  const AppointmentsState();

  @override
  List<Object> get props => [];
}

class AppointmentsInitial extends AppointmentsState {}

class LoadingNewAppointmentState extends AppointmentsState {}

class ErrorNewAppointmentState extends AppointmentsState {}

class SuccessNewAppointmentState extends AppointmentsState {}
