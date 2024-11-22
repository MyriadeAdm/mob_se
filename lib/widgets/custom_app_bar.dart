import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(
        child: Image.asset(
          'assets/images/mosbelogo.png',
          height: 30,
        ),
      ),
      actions: const [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
