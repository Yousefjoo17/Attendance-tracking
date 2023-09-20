import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: SizedBox(
          width: 120,
          height: 70,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}
