import 'package:flutter/material.dart';

class PageParametre extends StatelessWidget {
  const PageParametre({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "Parametres",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Divider(
          height: 60,
          indent: 80,
          endIndent: 80,
          color: Colors.black,
          thickness: 1.5,
        ),
      ]
    );
  
  }
  
}