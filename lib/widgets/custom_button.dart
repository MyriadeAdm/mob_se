import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  final String label;

  const CustomButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 55,
      width: 180,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.colorCustomButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: () => {},
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: ColorConstants.colorCustom2,
          ),
        ),
      ),
    );
  }
}
