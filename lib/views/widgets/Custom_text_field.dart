// ignore: file_names
import 'package:attendence_tracking/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CustomTextField(
      {required this.hinttext, this.onchanged, required this.obsecuretext});
  final String? hinttext;
  Function(String)? onchanged;
  final bool obsecuretext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      validator: (data) {
        if (data!.isEmpty) {
          return 'requeird';
        }
      },
      onChanged: onchanged,
      obscureText: obsecuretext,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kprimaryColor)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
