import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/menu_accueil/page_historique.dart';

class MyHistorieTitleLine extends StatelessWidget {
  const MyHistorieTitleLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Historique',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (BuildContext context) =>
                      const PageHistorique()));
            },
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero, // ca aussi
            ),
            child: Row(
              children: [
                Text(
                  'Tout afficher',
                  style:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Icon(
                  Icons.trending_flat,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
