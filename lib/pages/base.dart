import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import './home_page.dart';
import './forfait_page.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('USSD APP'),
        backgroundColor: Colors.white,
      ),
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Accueil",
            ),
          ),
          PersistentTabConfig(
            screen: const ForfaitPage(),
            item: ItemConfig(
              icon: const Icon(Icons.sync_alt),
              title: "Forfaits",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}