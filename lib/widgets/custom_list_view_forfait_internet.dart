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
          padding: const EdgeInsets.only(left: 10,right: 22),
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
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text(
                validite,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                prix,
                style: const TextStyle(
                  fontSize: 17,
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
