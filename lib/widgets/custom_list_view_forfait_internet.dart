import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';

class CustomListViewForfaitInternet extends StatelessWidget {
  final String mega;
  final String validite;
  final String prix;
  final Icon icon;

  const CustomListViewForfaitInternet(
      {super.key,
      required this.icon,
      required this.mega,
      required this.validite,
      required this.prix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.colorCustomButton,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  icon,
                  Text(
                    mega,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text(
                'Validité $validite',
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
