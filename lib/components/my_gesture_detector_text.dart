import 'package:flutter/material.dart';
import 'package:mob_se/components/my_toggle_button.dart';

class MyGestureDetectorText extends StatelessWidget {

  final String cname;
  const MyGestureDetectorText({super.key, required this.cname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text(
              'Sélectionner votre réseau',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            content: SizedBox(
              height: 80,
              child: Center(
                child: MyToggleButton(),
              ),
            ),
          ),
        );
      },
      child: Text(
        cname,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
