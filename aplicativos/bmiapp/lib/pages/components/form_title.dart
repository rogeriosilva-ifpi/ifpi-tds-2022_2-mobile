import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String title;

  const FormTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
        letterSpacing: 5,
        shadows: [
          Shadow(
            color: Colors.blueGrey,
            offset: Offset(-2, -2),
            blurRadius: 3,
          ),
        ],
      ),
    );
  }
}
