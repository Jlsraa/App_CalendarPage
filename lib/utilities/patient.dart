class Patient {
  String name = '';
  String email = '';
  String phone = '';
  DateTime? lastVisit;

  Patient(
      {required this.email,
      required this.phone,
      required this.lastVisit,
      required this.name});
}
