import 'package:attendence_tracking/Cubits/AttendencList_Cubit/home_cubit.dart';
import 'package:attendence_tracking/Cubits/Check_cubit/check_cubit.dart';
import 'package:attendence_tracking/Cubits/Login_Cubit/login_cubit.dart';
import 'package:attendence_tracking/Simple_Bloc_Observer.dart';
import 'package:attendence_tracking/constants.dart';
import 'package:attendence_tracking/firebase_options.dart';
import 'package:attendence_tracking/views/Login_View.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const AttendenceTrackingApp());
}

class AttendenceTrackingApp extends StatelessWidget {
  const AttendenceTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => AttendanceListCubit()),
        BlocProvider(create: (context) => CheckCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendence Tracking',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
        ),
        home: const LoginView(),
      ),
    );
  }
}
