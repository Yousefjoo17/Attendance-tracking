import 'package:attendence_tracking/views/widgets/attendence_tile.dart';
import 'package:flutter/material.dart';

class AttendenceListView extends StatelessWidget {
  const AttendenceListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: 20,
      itemBuilder: (context, index) {
        return const AttendenceTile();
      },
    );
  }
}
