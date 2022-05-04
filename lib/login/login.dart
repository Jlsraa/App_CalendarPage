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
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 200, 24, 24),
                  child: Text(
                    "Inicia sesión",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
                // Image.asset(
                //   "assets/icons/app_icon.png",
                //   height: 120,
                // ),
                SizedBox(height: 100),
                MaterialButton(
                  child: Text(
                    "Iniciar sesión con Google",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple[300],
                    ),
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
