import 'package:attendence_tracking/constants.dart';
import 'package:attendence_tracking/firebase_options.dart';
import 'package:attendence_tracking/views/Login_View.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AttendenceTrackingApp());
}

class AttendenceTrackingApp extends StatelessWidget {
  const AttendenceTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendence Tracking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
      ),
      home: const LoginView(),
    );
  }
}
