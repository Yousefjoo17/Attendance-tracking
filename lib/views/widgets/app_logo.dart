import 'package:attendence_tracking/constants.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 64,
      backgroundColor: kprimaryColor,
      child: CircleAvatar(
        radius: 58,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.track_changes,
          size: 70,
          color: kprimaryColor,
        ),
      ),
    );
  }
}
