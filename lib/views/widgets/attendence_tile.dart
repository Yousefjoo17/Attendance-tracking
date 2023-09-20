import 'package:attendence_tracking/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendenceTile extends StatelessWidget {
  const AttendenceTile({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.now();
    final formattedtime = DateFormat('dd/MM/yyyy  HH:mm').format(dateTime);

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
            "Check in : $formattedtime",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            "Check out : $formattedtime",
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
