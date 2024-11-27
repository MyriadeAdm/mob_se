import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;

  const MyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.inversePrimary),
    );
  }
}
