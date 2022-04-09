import 'package:flutter/material.dart';
import 'package:proyecto_01/content/profile/edit_profile_page.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 200, 0, 5),
                child: CircleAvatar(
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://source.unsplash.com/random'),
                    backgroundColor: Colors.white,
                    radius: 67,
                  ),
                  backgroundColor: Colors.white,
                  radius: 75,
                ),
              ),
              Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Quiropráctico",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
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
                        Text(
                          "john.doe@dr.com",
                          style: TextStyle(fontSize: 14),
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
                        Text(
                          "33 34 43 34 43",
                          style: TextStyle(fontSize: 14),
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
                        Text(
                          "Calle 111, Guadalajara, México",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
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
                    "Editar Perfil",
                    style: TextStyle(
                      fontSize: 16,
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
        ],
      ),
    );
  }
}
