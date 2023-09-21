import 'package:attendence_tracking/Cubits/Login_Cubit/login_cubit.dart';
import 'package:attendence_tracking/Models/User_model.dart';
import 'package:attendence_tracking/views/Home_View.dart';
import 'package:attendence_tracking/views/widgets/Custom_Button.dart';
import 'package:attendence_tracking/views/widgets/Custom_Font.dart';
import 'package:attendence_tracking/views/widgets/Custom_text_field.dart';
import 'package:attendence_tracking/views/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formkey = GlobalKey();
  UserModel user = UserModel();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            isLoading = false;
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomeView(user: user)));
          } else {
            isLoading = false;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
              key: formkey,
              child: Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 8, top: 52),
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
                        const Customfont(text: 'Attendance tracker', size: 30),
                        const SizedBox(height: 70),
                        const SizedBox(height: 10),
                        CustomTextField(
                          hinttext: 'Username',
                          obsecuretext: false,
                          onchanged: (value) {
                            user.name = value;
                          },
                          icon: const Icon(Icons.person),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          hinttext: 'Password',
                          obsecuretext: true,
                          onchanged: (value) {
                            user.password = value;
                          },
                          icon: const Icon(Icons.key),
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                            text: 'Login',
                            ontap: () {
                              if (formkey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context)
                                    .loginuser(user);
                              }
                            }),
                        const SizedBox(height: 140),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
