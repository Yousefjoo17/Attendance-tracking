// ignore: file_names
import 'package:attendence_tracking/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {

  CustomTextField(
      {required this.hinttext,
      this.onchanged,
      required this.obsecuretext,
      this.icon, required this.controller});
  final String? hinttext;
  Function(String)? onchanged;
  final bool obsecuretext;
  final Icon? icon;
    final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      validator: (data) {
        if (data!.isEmpty) {
          return 'requeird';
        }
        return null;
      },
      controller: controller,
      onChanged: onchanged,
      obscureText: obsecuretext,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: hinttext,
        labelStyle: const TextStyle(color: Colors.grey),
        hintText: hinttext,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kprimaryColor),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
