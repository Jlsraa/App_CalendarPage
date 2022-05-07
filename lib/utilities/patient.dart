class Patient {
  final String name;
  final String email;
  final String age;
  final String notes;
  final String phoneNumber;
  final String profilePhoto;
  DateTime? lastVisit;
  final String id;
  final String gender;

  Patient({
    required this.name,
    required this.email,
    required this.age,
    required this.notes,
    required this.phoneNumber,
    required this.profilePhoto,
    required this.lastVisit,
    required this.id,
    required this.gender,
  });

  String getDateFormat() {
    if (this.lastVisit == null) return "No date";
    return "${this.lastVisit!.day}/${this.lastVisit!.month}/${this.lastVisit!.year}";
  }

  @override
  String toString() {
    return "Name:${this.name}";
  }
}
