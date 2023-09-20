import 'package:flutter/material.dart';

class AttendenceListView extends StatelessWidget {
  const AttendenceListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Icon(
            Icons.abc,
            size: 100,
          );
        },
      ),
    );
  }
}

