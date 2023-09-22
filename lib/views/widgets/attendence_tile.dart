import 'package:attendence_tracking/constants.dart';
import 'package:flutter/material.dart';

class AttendenceTile extends StatelessWidget {
  const AttendenceTile(
      {super.key, required this.checkIn, required this.checkOut});
  final dynamic checkIn, checkOut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64),
          boxShadow: [
            BoxShadow(
              color: kprimaryColor.withOpacity(0.1),
              spreadRadius: .2,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(children: [
          Text(
            "Check in : $checkIn",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "Check out : $checkOut",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ]),
      ),
    );
  }
}
