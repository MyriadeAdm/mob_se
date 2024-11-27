import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../constants/reseaux.dart';

class MyToggleButton extends StatefulWidget {
  const MyToggleButton({super.key});

  @override
  State<MyToggleButton> createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton> {
  @override
  Widget build(BuildContext context) {
    var selectedCarrier = Provider.of<Reseaux>(context).reseau == 'Yas'
        ? [true, false]
        : [false, true];

    const List<String> carrier = ['Yas', 'Moov'];

    Color colorItem() {
      return Provider.of<Reseaux>(context, listen: false).reseau == 'Yas'
          ? ColorConstants.colorCustomButtonTg
          : ColorConstants.colorCustomButtonMv;
    }

    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < selectedCarrier.length; i++) {
            selectedCarrier[i] = i == index;
            if (index == 0) {
              Provider.of<Reseaux>(context, listen: false).switchToTogocom();
            } else {
              Provider.of<Reseaux>(context, listen: false).switchToMoov();
            }
          }
        });
        Navigator.of(context).pop();
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(13),
      ),
      selectedBorderColor: colorItem(),
      selectedColor: Theme.of(context).colorScheme.onSurface,
      fillColor: colorItem(),
      color: Provider.of<Reseaux>(context, listen: false).reseau == 'Yas'
          ? ColorConstants.colorCustomButtonMv
          : Theme.of(context).colorScheme.inversePrimary,
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      isSelected: selectedCarrier,
      children: [
        Text(carrier[0],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            )),
        Text(carrier[1],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
