part of 'appointments_bloc.dart';

abstract class AppointmentsEvent extends Equatable {
  const AppointmentsEvent();

  @override
  List<Object> get props => [];
}

class NewAppointmentEvent extends AppointmentsEvent {
  final Map<String, dynamic> appointmentData;

  NewAppointmentEvent({required this.appointmentData});

  @override
  List<Object> get props => [this.appointmentData];
}
