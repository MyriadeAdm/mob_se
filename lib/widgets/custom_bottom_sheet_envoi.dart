import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Future<void> callButtomSheet(
    BuildContext context, String numero, String montantEnvoye) async {
  await showModalBottomSheet<dynamic>(
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: (context) {
      return Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Envoie vers le"),
                    Text(numero),
                    SizedBox(
                      child: Column(children: [
                        Row(
                          children: [
                            const Text("Montant a envoyer :"),
                            Text("$montantEnvoye F CFA"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Frais de transaction :"),
                            Text("$montantEnvoye F CFA"),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    },
  );
}
