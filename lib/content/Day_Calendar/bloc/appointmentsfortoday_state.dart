part of 'appointmentsfortoday_bloc.dart';

abstract class AppointmentsfortodayState extends Equatable {
  const AppointmentsfortodayState();

  @override
  List<Object> get props => [];
}

class AppointmentsfortodayInitial extends AppointmentsfortodayState {}

class LoadingAppointmentsState extends AppointmentsfortodayState {}

class ErrorAppointmentsState extends AppointmentsfortodayState {}

class SuccessAppointmentsState extends AppointmentsfortodayState {
  final List<Meeting> meetings;

  SuccessAppointmentsState({required this.meetings});

  @override
  List<Object> get props => [];
}
