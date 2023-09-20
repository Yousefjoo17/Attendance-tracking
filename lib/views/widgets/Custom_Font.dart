import 'package:flutter/material.dart';

class Customfont extends StatelessWidget {
  const Customfont({
    super.key,
    required this.text,
    required this.size,
  });
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Skranji',
      ),
    );
  }
}
