import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.all(15),
        child: Image.asset(
          'assets/images/mosbelogo.png',
          width: 130,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.sunny)),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
