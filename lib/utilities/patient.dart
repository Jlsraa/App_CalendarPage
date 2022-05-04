class Patient {
  String name = '';
  String email = '';
  String phone = '';
  DateTime? lastVisit;
  String id;

  Patient(
      {required this.email,
      required this.phone,
      required this.lastVisit,
      required this.name,
      required this.id});

  String getDateFormat() {
    return "${this.lastVisit!.day}/${this.lastVisit!.month}/${this.lastVisit!.year}";
  }
}
