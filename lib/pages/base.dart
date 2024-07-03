import 'package:flutter/material.dart';
import 'package:mob_se/pages/transactions_page.dart';
import 'package:mob_se/widgets/custom_app_bar.dart';
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
      appBar: const CustomAppBar(),
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
          PersistentTabConfig(
            screen: const TransactionsPage(),
            item: ItemConfig(
              icon: const Icon(Icons.attach_money),
              title: "Transactions",
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