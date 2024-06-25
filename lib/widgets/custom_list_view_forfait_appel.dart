import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';

class CustomListViewForfaitAppel extends StatelessWidget {
  final String credit;
  final String msg;
  final String validite;
  final String prix;
  final Icon icon;

  const CustomListViewForfaitAppel(
      {super.key,
      required this.icon,
      required this.credit,
      required this.msg,
      required this.validite,
      required this.prix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.colorCustomButton,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  icon,
                  Text(
                    credit,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text(
                'Validite $validite + $msg SMS',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                '$prix XOF',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
