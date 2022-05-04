import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  late String userPhoto;
  late String userName;
  late String userSpecialty;
  late String userEmail;
  late int userPhoneNumber;
  late String userAddress;
  late Array userPatients;

  Future<void> fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('userDoctor')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        userPhoto = ds.data()!['profilePicture'];
        userName = ds.data()!['name'];
        userSpecialty = ds.data()!['specialty'];
        userEmail = ds.data()!['email'];
        userPhoneNumber = ds.data()!['phoneNumber'];
        userAddress = ds.data()!['address'];
        userPatients = ds.data()!['patients'];
      }).catchError((e) {
        print(e);
      });
  }
}
