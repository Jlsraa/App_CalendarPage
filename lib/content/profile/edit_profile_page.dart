import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_01/utilities/components/simple_appbar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  String? userPhoto;
  String? userName;
  String? userSpecialty;
  String? userEmail;
  String? userPhoneNumber;
  String? userAddress;

  TextEditingController? _name = TextEditingController();
  // TextEditingController? _photo = TextEditingController();
  TextEditingController? _specialty = TextEditingController();
  TextEditingController? _email = TextEditingController();
  TextEditingController? _phone = TextEditingController();
  TextEditingController? _address = TextEditingController();

  //var userNameText = _name?.text.toString();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void dispose() {
    _name?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();
    return Scaffold(
      appBar: getSimpleAppBar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                minRadius: 48.0,
                maxRadius: 50.0,
                backgroundImage: NetworkImage(
                    "${FirebaseAuth.instance.currentUser!.photoURL}"),
              ),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(height: 16.0),
              Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _name,
                      decoration: InputDecoration(labelText: "Name"),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _specialty,
                      decoration: InputDecoration(labelText: "Specialty"),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _phone,
                      decoration:
                          InputDecoration(labelText: "Telephone Number"),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _email,
                      decoration: InputDecoration(labelText: "E-mail"),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _address,
                      decoration: InputDecoration(labelText: "Address"),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: Text(
                                        "Profile edited",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromRGBO(106, 99, 242, 1),
                                        ),
                                      ),
                                      content: Text("Save your changes?"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'CANCEL');
                                          },
                                          child: Text(
                                            'CANCEL',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[700]),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'OK');
                                            _updateData();
                                          },
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    106, 99, 242, 1)),
                                          ),
                                        )
                                      ],
                                    ));
                          },
                          child: Text(
                            "Save Changes",
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 32.0, vertical: 16.0),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(0.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _fetchData() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('userDoctor')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) async {
        if (!mounted) return;
        setState(() {
          userPhoto = ds.data()!['profilePicture'];
          userName = ds.data()!['name'];
          userSpecialty = ds.data()!['specialty'];
          userEmail = ds.data()!['email'];
          userPhoneNumber = ds.data()!['phoneNumber'];
          userAddress = ds.data()!['address'];
        });
      }).catchError((e) {
        print(e);
      });
    print(_name);
  }

  void _updateData() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("userDoctor")
        .doc(firebaseUser?.uid)
        .update({
      "name": _name?.text,
      "address": _address?.text,
      "email": _email?.text,
      "phoneNumber": _phone?.text,
      "specialty": _specialty?.text
    }).then((_) {
      if (!mounted) return;
      print("success!");
    });
  }
}
