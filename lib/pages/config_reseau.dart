import 'package:flutter/material.dart';
import 'package:mob_se/constants/reseaux.dart';
import 'package:mob_se/pages/base.dart';
import 'package:provider/provider.dart';

class ConfigReseau extends StatelessWidget {
  const ConfigReseau({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Choix du reseau :"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<Reseaux>().switchToTogocom();
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const Base()),
                          (Route<dynamic> route) => false,);
                      },
                      child: const Text("Togocom")),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<Reseaux>().switchToMoov();
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => const Base()),
                          (Route<dynamic> route) => false,);
                      },
                      child: const Text("Moov")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
