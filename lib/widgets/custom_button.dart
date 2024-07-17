import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/constants/color_constants.dart';

import '../constants/constantes.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final String code;

  const CustomButton({super.key, required this.label, required this.code});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.colorCustomButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
        onPressed: () {
          FlutterPhoneDirectCaller.callNumber(code);
        },
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: ColorConstants.colorCustom2,
          ),
        ),
      ),
    );
  }
}
