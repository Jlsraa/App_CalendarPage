import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_01/auth/bloc/auth_bloc.dart';
import 'package:proyecto_01/home/home_page.dart';
import 'package:proyecto_01/login/login.dart';

import 'content/Day_Calendar/bloc/appointmentsfortoday_bloc.dart';
import 'content/Schedule/bloc/appointments_bloc.dart';
import 'content/patients/bloc/patients_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppointmentsfortodayBloc()..add(GetAppointmentsForTodayEvent()),
        ),
        BlocProvider(
          create: (context) => AuthBloc()..add(VerifyAuthEvent()),
        ),
        BlocProvider(
          create: (context) => AppointmentsBloc(),
        ),
        BlocProvider(
          create: (context) => PatientsBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(106, 99, 242, 1),
        ),
      ),
      title: 'Material App',
      //home: HomePage(),
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AuthSuccessState) {
            return HomePage();
          } else if (state is UnAuthState ||
              state is AuthErrorState ||
              state is SignOutSuccessState) {
            return LoginPage();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
