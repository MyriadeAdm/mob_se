import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';

import 'custum_bottom_sheet.dart';

class CustomListViewForfaitAppel extends StatelessWidget {
  final String credit;
  final String msg;
  final String validite;
  final String prix;
  final Icon icon;
  final String codeMMCredit;
  final String codeAutruiCredit;

  const CustomListViewForfaitAppel(
      {super.key,
      required this.icon,
      required this.credit,
      required this.msg,
      required this.validite,
      required this.prix,
      required this.codeMMCredit,
      required this.codeAutruiCredit,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          callButtomSheet(context, credit, msg, validite, prix, codeMMCredit, codeAutruiCredit);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(style: BorderStyle.solid, width: 3, color: Colors.amber),
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
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              '$validite + $msg' ,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Text(
              prix,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
