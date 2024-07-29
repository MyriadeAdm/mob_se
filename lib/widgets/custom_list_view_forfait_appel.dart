import 'package:flutter/material.dart';

import 'custum_bottom_sheet.dart';

class CustomListViewForfaitAppel extends StatelessWidget {
  final String credit;
  final String msg;
  final String validite;
  final String prix;
  final Icon icon;
  final String codeMMCredit;
  final String codeAutruiCredit;
  final dynamic mega;

  const CustomListViewForfaitAppel(
      {super.key,
      required this.icon,
      required this.credit,
      required this.msg,
      required this.validite,
      required this.prix,
      required this.codeMMCredit,
      required this.codeAutruiCredit,
      required this.mega,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ElevatedButton(
        onPressed: () {
          callButtomSheet(context, credit, msg, validite, prix, codeMMCredit, codeAutruiCredit, mega);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(13),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            side: BorderSide(
              style: BorderStyle.solid,
              width: 1.5,
              color: Colors.amber),
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
                    fontSize: 14,
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
