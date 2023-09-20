import 'package:attendence_tracking/views/Home_View.dart';
import 'package:attendence_tracking/views/widgets/Custom_Button.dart';
import 'package:attendence_tracking/views/widgets/Custom_text_field.dart';
import 'package:attendence_tracking/views/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 52),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const AppLogo(),
                const SizedBox(height: 20),
                const Text(
                  'Attendance tracker',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Skranji',
                  ),
                ),
                const SizedBox(height: 70),
                const SizedBox(height: 10),
                CustomTextField(
                  hinttext: 'Username',
                  obsecuretext: false,
                  onchanged: (value) {},
                  icon: const Icon(Icons.person),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hinttext: 'Password',
                  obsecuretext: true,
                  onchanged: (value) {},
                  icon: const Icon(Icons.key),
                ),
                const SizedBox(height: 30),
                CustomButton(
                    text: 'Login',
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                      );
                    }),
                const SizedBox(height: 140),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
