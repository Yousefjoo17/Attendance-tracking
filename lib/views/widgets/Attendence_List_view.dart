import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/views/widgets/attendence_tile.dart';
import 'package:flutter/material.dart';

class AttendenceListView extends StatelessWidget {
  const AttendenceListView({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    print(
      userModel.checkList!.length,
    );
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: userModel.checkList!.length,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return AttendenceTile(
            checkIn: userModel.checkList![index],
            checkOut: userModel.checkList![index],
          );
        } else {
          return const Divider(
            color: Colors.white,
          );
        }
      },
    );
  }
}
