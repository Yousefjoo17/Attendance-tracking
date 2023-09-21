import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/helpers/Show_snack_bar.dart';
import 'package:attendence_tracking/views/widgets/Attendence_List_view.dart';
import 'package:attendence_tracking/views/widgets/Custom_Divider.dart';
import 'package:attendence_tracking/views/widgets/Custom_Font.dart';
import 'package:attendence_tracking/views/widgets/Custom_elevatedButton.dart';
import 'package:attendence_tracking/views/widgets/Home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HomeAppBar(),
            const SizedBox(height: 20),
            const Icon(
              Icons.person_2_sharp,
              size: 100,
            ),
            Customfont(text: userModel.name!, size: 35),
            const CustomDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  text: 'Check in',
                  onPressed: () {
                    showmySnackBar(context, 'you have succeffuly checked in');
                  },
                ),
                const SizedBox(width: 20),
                CustomElevatedButton(
                  text: 'Check out',
                  onPressed: () {
                    showmySnackBar(context, 'you have succeffuly checked out');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: AttendenceListView(),
            )),
          ],
        ),
      ),
    );
  }
}
