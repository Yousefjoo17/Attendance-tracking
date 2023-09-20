import 'package:attendence_tracking/constants.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Divider(
        indent: 30,
        endIndent: 30,
        color: kprimaryColor,
        thickness: 0.7,
      ),
    );
  }
}