import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/lib/make_call.dart';
import 'package:provider/provider.dart';

import '../constants/reseaux.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final String code;

  const CustomButton({super.key, required this.label, required this.code});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: (context.watch<Reseaux>().reseau == "Togocom")
                ? ColorConstants.colorCustomButtonTg
                : ColorConstants.colorCustomButtonMv,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: () {
          makePhoneCall(code);
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: (context.watch<Reseaux>().reseau == "Togocom")
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
