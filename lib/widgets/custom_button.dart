import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:provider/provider.dart';

import '../constants/reseaux.dart';

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
            backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
        onPressed: () {
          FlutterPhoneDirectCaller.callNumber(code);
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
