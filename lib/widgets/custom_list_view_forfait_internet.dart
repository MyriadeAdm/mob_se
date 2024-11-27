import 'package:flutter/material.dart';
import 'package:mob_se/models/type_forfait.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../constants/reseaux.dart';
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
          backgroundColor: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.only(left: 18, right: 18),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            side: BorderSide(
                style: BorderStyle.solid,
                width: 1.5,
                color: (context.watch<Reseaux>().reseau == "Yas")
                    ? ColorConstants.colorCustomButton2
                    : ColorConstants.colorCustomButtonMv),
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
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              validite,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 12,
              ),
            ),
            Text(
              prix,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
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
