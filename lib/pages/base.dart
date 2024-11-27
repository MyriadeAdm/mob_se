import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mob_se/pages/page_transactions.dart';
import 'package:mob_se/pages/settings_page.dart';
import 'package:mob_se/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import '../constants/color_constants.dart';
import '../constants/reseaux.dart';
import 'menu_accueil/home_page.dart';
import 'page_forfait.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ForfaitPage(),
    TransactionsPage(),
    SettingsPage(),
  ];

  Color colorItem() {
    if (context.watch<Reseaux>().reseau == "Yas") {
      return ColorConstants.colorCustomButtonTg;
    } else {
      return ColorConstants.colorCustomButtonMv;
    }
  }

  Color colorTextItem() {
    if (context.watch<Reseaux>().reseau == "Yas") {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const CustomAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: colorTextItem(),
              iconSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: colorItem(),
              color: Theme.of(context).colorScheme.inversePrimary,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Accueil',
                ),
                GButton(
                  icon: LineIcons.syncIcon,
                  text: 'Forfaits',
                ),
                GButton(
                  icon: LineIcons.dollarSign,
                  text: 'Transactions',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
