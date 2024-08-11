import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../models/historique_database.dart';

final _codeAgentController = TextEditingController();
final _montantController = TextEditingController();
final _codeController = TextEditingController();

class PageRetrait extends StatelessWidget {
  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  const PageRetrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  returnBack(context),
                  const Text(
                    "Retrait",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ]),
                const Divider(
                  height: 30,
                  indent: 50,
                  endIndent: 50,
                  color: Colors.black,
                  thickness: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Code Agent',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(5),
                                  ],
                                  controller: _codeAgentController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: ColorConstants.colorCustomButton2,
                                    ),
                                  )
                                  ),
                                  style: const TextStyle(
                                    fontSize: 25,
                                    letterSpacing: 8.0,
                                    fontWeight: FontWeight.w900,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Montant',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextField(
                                  textAlign: TextAlign.right,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(7),
                                  ],
                                  controller: _montantController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: ColorConstants.colorCustomButton2,
                                    ),
                                  )
                                  ),
                                  style: const TextStyle(
                                    fontSize: 25,
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'F CFA',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: ColorConstants.colorCustom3,
                                fontSize: 35,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Code secret',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                textAlign: TextAlign.center,
                                //autofocus: true,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                //onChanged: (){},
                                obscuringCharacter: "*",
                                controller: _codeController,
                                //focusNode: _codeControllerFocusNode,
                                decoration: InputDecoration(
                                  filled: true,
                                  //hintText: '',
                                  fillColor:
                                      const Color.fromRGBO(230, 227, 227, 1),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  // suggixIcon: IconButton(
                                  //   onPressed: () {
                                  //     _codeController.clear();
                                  //   },
                                  //   icon: const Icon(
                                  //     Icons.clear,
                                  //     size: 15,
                                  //     color: Colors.grey,
                                  //   ),
                                  // ),
                                ),
                                style: const TextStyle(
                                  letterSpacing: 8.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      var codeAgent = _codeAgentController.text;
                      var montant = _montantController.text;
                      var codeSecret = _codeController.text;

                      if (codeAgent == '') {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                  title: Text("Code agent non saisie",
                                  textAlign: TextAlign.center),
                                  content: Text(
                                      "Veuillez renseigner le code agent",
                                      textAlign: TextAlign.center));
                            });
                      } else {
                        if (montant == '' || int.parse(montant) <= 0) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                    title: Text("Montant Insuffisant",
                                    textAlign: TextAlign.center),
                                    content: Text(
                                        "Veuillez renseigner un montant supérieur à 0 F CFA",
                                        textAlign: TextAlign.center));
                              });
                        } else {
                          if (codeSecret == '') {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                      title: Text(
                                        "Code Non Renseigné",
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Text(
                                        "Veuillez renseigner votre code secret",
                                        textAlign: TextAlign.center,
                                      ));
                                });
                          } else {
                            FlutterPhoneDirectCaller.callNumber(
                                "*145*2*$montant*$codeAgent*$codeSecret#");

                            context.read<HistoriqueDatabase>()
                                    .addHistorique("Retrait", "$montant F CFA retiré chez l'agent $codeAgent."
                                        );
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.colorCustomButton2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                      child: Text(
                        'CONFIRMER',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
