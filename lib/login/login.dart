import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_01/auth/bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/login.png',
            fit: BoxFit.contain,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
          ),
          Image.asset(
            'assets/images/illustration.png',
            fit: BoxFit.scaleDown,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 500, 24, 00),
                  child: Text(
                    "Doctor Calendar App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
                // Image.asset(
                //   "assets/icons/app_icon.png",
                //   height: 120,
                // ),
                SizedBox(height: 50),
                MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Signin with Google",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple[300],
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white.withOpacity(0.90),
                  height: 50,
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(GoogleAuthEvent());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
