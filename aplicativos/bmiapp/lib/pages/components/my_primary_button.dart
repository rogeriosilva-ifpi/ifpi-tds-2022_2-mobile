import 'package:flutter/material.dart';

class MyPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const MyPrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
