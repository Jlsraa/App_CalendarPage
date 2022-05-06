part of 'appointmentsfortoday_bloc.dart';

abstract class AppointmentsfortodayEvent extends Equatable {
  const AppointmentsfortodayEvent();

  @override
  List<Object> get props => [];
}

class GetAppointmentsForTodayEvent extends AppointmentsfortodayEvent {}
