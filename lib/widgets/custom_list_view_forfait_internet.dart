import 'package:flutter/material.dart';
import 'package:mob_se/models/type_forfait.dart';

import 'custum_bottom_sheet.dart';

class CustomListViewForfaitInternet extends StatelessWidget {
  final String mega;
  final String validite;
  final String prix;
  final Icon icon;
  final String codeMMCredit;
  final String codeAutruiCredit;
  final String codeMoneyMM;
  final String codeMoneyAutruit;
  final Typeforfait typeforfait;

  const CustomListViewForfaitInternet({
    super.key,
    required this.icon,
    required this.mega,
    required this.validite,
    required this.prix,
    required this.codeMMCredit,
    required this.codeAutruiCredit,
    required this.codeMoneyMM,
    required this.codeMoneyAutruit,
    required this.typeforfait,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          callButtomSheet(
              context,
              '',
              '',
              validite,
              prix,
              codeMMCredit,
              codeAutruiCredit,
              codeMoneyMM,
              codeMoneyAutruit,
              mega,
              typeforfait);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.only(left: 18, right: 18),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(
                style: BorderStyle.solid, width: 1.5, color: Colors.amber),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 5),
                Text(
                  mega,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              validite,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Text(
              prix,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
