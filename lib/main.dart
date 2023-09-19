import 'package:attendence_tracking/constants.dart';
import 'package:attendence_tracking/views/Login_View.dart';
import 'package:flutter/material.dart';

void main() {
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
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}


