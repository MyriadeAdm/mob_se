import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Image.asset(
        'assets/images/mosbelogo.png',
        width: 130,
      ),
      actions: const [
        
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
