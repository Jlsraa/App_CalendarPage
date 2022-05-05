import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_01/content/profile/edit_profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final firebaseInstance = FirebaseFirestore.instance;
  late String userPhoto;
  late String userName;
  late String userSpecialty;
  late String userEmail;
  late String userPhoneNumber;
  late String userAddress;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          Image(
            image: AssetImage('assets/images/profile_bg.png'),
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 50, 330, 700),
            height: 100,
            width: 50,
            child: IconButton(
              alignment: Alignment.topLeft,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 45.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 200, 0, 5),
                  child: CircleAvatar(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage('${user!.photoURL}'),
                      backgroundColor: Colors.white,
                      radius: 67,
                    ),
                    backgroundColor: Colors.white,
                    radius: 75,
                  ),
                ),
                FutureBuilder(
                  future: _fetch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return CircularProgressIndicator();
                    return Text(
                      "$userName",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: _fetch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return CircularProgressIndicator();
                    return Text(
                      "$userSpecialty",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    );
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 30,
                            color: Color.fromRGBO(106, 99, 242, 1),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              FutureBuilder(
                                future: _fetch(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState !=
                                      ConnectionState.done)
                                    return CircularProgressIndicator();
                                  return Text(
                                    "${user!.email}",
                                    style: TextStyle(fontSize: 16),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 30,
                            color: Color.fromRGBO(106, 99, 242, 1),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          FutureBuilder(
                            future: _fetch(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done)
                                return CircularProgressIndicator();
                              return Text(
                                "$userPhoneNumber",
                                style: TextStyle(fontSize: 16),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 30,
                            color: Color.fromRGBO(106, 99, 242, 1),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          FutureBuilder(
                            future: _fetch(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done)
                                return CircularProgressIndicator();
                              return Text(
                                "$userAddress",
                                style: TextStyle(fontSize: 16),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(262, 61)),
                    elevation: MaterialStateProperty.all(0.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(
                          color: Color.fromRGBO(106, 99, 242, 1),
                        ),
                      ),
                    ),
                  ),
                  child: TextButton(
                    child: Text(
                      "Edit profile",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _fetch() async {
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
      }).catchError((e) {
        print(e);
      });
  }
}
