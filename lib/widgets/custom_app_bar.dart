import 'package:flutter/material.dart';
import 'package:mob_se/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 5),
            child: (Provider.of<ThemeProvider>(context).isDarkMode)
                ? Image.asset(
                    'assets/images/mobse_logo_white.png',
                    height: 50,
                  )
                : Image.asset(
                    'assets/images/mosbelogo.png',
                    height: 50,
                  ),
          ),
        ),
        actions: const [],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
