import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../constants/reseaux.dart';

class MyGestureDetectorButton extends StatelessWidget {
  const MyGestureDetectorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragDown: (details) {
        HapticFeedback.heavyImpact();
        if (Provider.of<Reseaux>(context, listen: false).reseau ==
            "Togocom") {
          context.read<Reseaux>().switchToMoov();
        } else {
          context.read<Reseaux>().switchToTogocom();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Ink(
            height: 50,
            width: 35,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Color.fromRGBO(135, 138, 143, 1),
            ),
            child: const Icon(
              Icons.sim_card,
              color: Colors.white,
              size: 20,
            )),
      ),
    );
  }
}

