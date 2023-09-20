import 'package:attendence_tracking/constants.dart';
import 'package:attendence_tracking/views/widgets/Custom_Font.dart';
import 'package:attendence_tracking/views/widgets/Custom_elevatedButton.dart';
import 'package:attendence_tracking/views/widgets/Home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            const Customfont(text: 'name', size: 35),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(
                indent: 30,
                endIndent: 30,
                color: kprimaryColor,
                thickness: 0.7,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  text: 'Check in',
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
                CustomElevatedButton(
                  text: 'Check out',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.abc,
                    size: 100,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
