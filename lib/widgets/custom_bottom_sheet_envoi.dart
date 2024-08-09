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

Future<void> callButtomSheetEnvoie(BuildContext context,
    String numero,
    int montantEnvoye, int fraisTransaction,
    [int fraisRetrait = 0]) async {
  await showModalBottomSheet<dynamic>(
    useRootNavigator: true,
    //isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: (context) {
      return SizedBox(
        //height: 250,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Envoie vers le",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
              Text(
                ("${numero[0]}${numero[1]} ${numero[2]}${numero[3]} ${numero[4]}${numero[5]} ${numero[6]}${numero[7]}"),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),


              Container(
                decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                border: Border.all(width: 0.5),
                //color: const Color.fromRGBO(241, 240, 240, 1),
              ),
                child: Padding(
                  padding: const EdgeInsets.only(top:25, left: 25, right: 25, bottom: 20),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Montant à envoyer :"),
                        Text("$montantEnvoye F CFA"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Frais de transaction :"),
                        Text("$fraisTransaction F CFA"),
                      ],
                    ),
                    const SizedBox(height: 10),
                                  const Divider(
                thickness: 0.5,
                color: ColorConstants.colorCustom2,
              ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Montant à débiter :",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "${montantEnvoye + fraisTransaction} F CFA",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.colorCustomButton2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Valider',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
