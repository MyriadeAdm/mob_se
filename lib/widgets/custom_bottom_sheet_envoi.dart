import 'package:flutter/material.dart';

import '../constants/color_constants.dart';


final _codeController = TextEditingController();

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Future<void> callButtomSheetEnvoie(
    BuildContext context, String numero, int montantEnvoye, int fraisTransaction, [int fraisRetrait=0]) async {
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
                            const Text("Montant à envoyer :"),
                            Text("$montantEnvoye F CFA"),
                            
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Frais de transaction :"),
                            Text("$fraisTransaction F CFA"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Montant à débiter :"),
                            Text("${montantEnvoye + fraisTransaction} F CFA"),
                          ],
                        ),
                      ]),
                    ),
                    TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: _codeController,
                        decoration: InputDecoration(
                          hintText: 'Code secret',
                          filled: true,
                          fillColor: const Color.fromRGBO(230, 227, 227, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    ),

                    ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorConstants.colorCustomButton2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                child: const Text(
                                  'Valider',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
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
