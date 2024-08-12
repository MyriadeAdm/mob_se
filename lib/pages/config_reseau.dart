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
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  context.read<Reseaux>().switchToTogocom();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Base()));
                }, child: const Text("TOGOCOM")),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: () {
                  context.read<Reseaux>().switchToMoov();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Base()));
                }, child: const Text("Moov"))
              ],
            )
          ],
        ),
      ),
    );
  }
}