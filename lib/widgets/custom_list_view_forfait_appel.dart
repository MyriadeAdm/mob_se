import 'package:flutter/material.dart';
import 'package:mob_se/models/type_forfait.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../constants/reseaux.dart';
import 'custum_bottom_sheet.dart';

class CustomListViewForfaitAppel extends StatelessWidget {
  final String credit;
  final String msg;
  final String validity;
  final String prix;
  final Icon icon;
  final String codeMMCredit;
  final String codeAutruiCredit;
  final String codeMoneyMM;
  final String codeMoneyAutrui;
  final dynamic mega;
  final Typeforfait typeForfait;

  const CustomListViewForfaitAppel(
      {super.key,
      required this.icon,
      required this.credit,
      required this.msg,
      required this.validity,
      required this.prix,
      required this.codeMMCredit,
      required this.codeAutruiCredit,
      required this.codeMoneyMM,
      required this.codeMoneyAutrui,
      required this.mega,
      required this.typeForfait});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          callButtomSheet(
              context,
              credit,
              msg,
              validity,
              prix,
              codeMMCredit,
              codeAutruiCredit,
              codeMoneyMM,
              codeMoneyAutrui,
              mega,
              typeForfait);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.all(13),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            side: BorderSide(
                style: BorderStyle.solid,
                width: 1.5,
                color: (context.watch<Reseaux>().reseau == "Togocom")
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
                  credit,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              (context.watch<Reseaux>().reseau == "Togocom")
                  ? '$validity + $msg'
                  : validity,
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
