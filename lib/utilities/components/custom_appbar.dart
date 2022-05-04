import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/bloc/auth_bloc.dart';
import '../../content/profile/profile.dart';

late String userPhoto;
late String userName;

dynamic getCustomAppBar(BuildContext context) {
  return AppBar(
    // centerTitle: false,
    leading: IconButton(
      padding: EdgeInsets.only(left: 24),
      icon: Icon(Icons.logout_outlined, size: 30.0),
      color: Colors.grey[850],
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(106, 99, 242, 1)),
            ),
            content: Text("Are you sure you want to log out?"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'CANCEL'),
                child: Text(
                  'CANCEL',
                  style: TextStyle(fontSize: 16, color: Colors.grey[850]),
                ),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    SignOutEvent(),
                  );
                  Navigator.pop(context, 'OK');
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(106, 99, 242, 1),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
    toolbarHeight: 100,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: FutureBuilder(
              future: _fetch(),
              builder: (context, snapshot) {
                return Text(
                  "$userName",
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                );
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://source.unsplash.com/random'),
          ),
        ),
      ],
    ),
  );
}

_fetch() async {
  final firebaseUser = await FirebaseAuth.instance.currentUser;
  if (firebaseUser != null)
    await FirebaseFirestore.instance
        .collection('userDoctor')
        .doc(firebaseUser.uid)
        .get()
        .then((ds) {
      userPhoto = ds.data()!['profilePicture'];
      userName = ds.data()!['name'];
    }).catchError((e) {
      print(e);
    });
}
// AppBar customAppBar = AppBar(
//   // centerTitle: false,
//   leading: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 24.0),
//     child: IconButton(
//       icon: Icon(Icons.clear_all_rounded, size: 32.0),
//       color: Colors.black,
//       onPressed: () {},
//     ),
//   ),
//   toolbarHeight: 100,
//   backgroundColor: Colors.transparent,
//   elevation: 0.0,
//   title: Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(right: 16.0),
//         child: TextButton(
//           onPressed: () {},
//           child: Text(
//             'John Doe',
//             textAlign: TextAlign.end,
//             style: TextStyle(
//               color: Colors.grey[900],
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ),
//       ),
//       CircleAvatar(
//         backgroundImage: NetworkImage('https://source.unsplash.com/random'),
//       ),
//     ],
//   ),
// );
