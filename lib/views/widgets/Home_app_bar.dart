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
      child: Row(
        children: [
          const Spacer(flex: 1),
          const Icon(
            Icons.notifications,
            size: 30,
            color: Colors.white,
          ),
          const Spacer(flex: 20),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.exit_to_app_sharp,
              size: 30,
              color: Colors.white,
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
