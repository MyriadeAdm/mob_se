import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';

class ForfaitVoixPage extends StatelessWidget {
  const ForfaitVoixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Achat Forfait Voix'),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: Constantes.forfaitsAppel.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = Constantes.forfaitsAppel[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    child: SizedBox(
                      height: 65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.colorCustomButton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.call_made,
                            ),
                            Text(
                              item.credit,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              item.validite,
                              style:
                                  const TextStyle(fontWeight: FontWeight.normal),
                            ),
                            
                            Text(
                              '${item.prix} XOF',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
