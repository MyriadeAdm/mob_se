import 'package:flutter/material.dart';

class PageParametre extends StatelessWidget {
  const PageParametre({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left:20, right:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Paramètres",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          Divider(
            height: 60,
            //indent: 80,
            //endIndent: 80,
            color: Colors.black,
            thickness: 1,
          ),
        ]
      ),
    );
  
  }
  
}