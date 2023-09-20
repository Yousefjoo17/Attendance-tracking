import 'package:attendence_tracking/constants.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: kprimaryColor,
      padding: const EdgeInsets.only(top: 40),
      child: const Row(
        children: [
          Spacer(flex: 1),
          Icon(
            Icons.list,
            size: 35,
            color: Colors.white,
          ),
          Spacer(flex: 20),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
