import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/reseaux.dart';
import 'package:mob_se/lib/make_call.dart';
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
        appBar: AppBar(
          title: const Text(
            "Retrait d'argent",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 30,
                  indent: 50,
                  endIndent: 50,
                  color: Colors.black,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
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
                          fontWeight: FontWeight.w600,
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
                                        color:
                                            ColorConstants.colorCustomButton2,
                                      ),
                                    )),
                                style: const TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 8.0,
                                  fontWeight: FontWeight.w700,
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
                          fontWeight: FontWeight.w600,
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
                                        color:
                                            ColorConstants.colorCustomButton2,
                                      ),
                                    )),
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
                          fontWeight: FontWeight.w600,
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
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                duration: Duration(milliseconds: 500),
                                content:
                                    Text('Veuillez renseigner le code agent')));
                      } else {
                        if (montant == '' || int.parse(montant) <= 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  duration: Duration(milliseconds: 500),
                                  content:
                                      Text('Veuillez renseigner un montant')));
                        } else {
                          if (codeSecret == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(milliseconds: 500),
                                    content: Text(
                                        'Veuillez renseigner votre code')));
                          } else {
                            Platform.isAndroid
                                ? FlutterPhoneDirectCaller.callNumber(
                                    "*145*2*$montant*$codeAgent*$codeSecret#")
                                : makePhoneCall(
                                    "*145*2*$montant*$codeAgent*$codeSecret#");

                            context.read<HistoriqueDatabase>().addHistorique(
                                "Retrait",
                                "$montant F CFA retiré chez l'agent $codeAgent.");
                          }
                        }
                      }
                      _codeAgentController.clear();
                      _montantController.clear();
                      _codeController.clear();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (context.watch<Reseaux>().reseau == "Togocom")
                                ? ColorConstants.colorCustomButton2
                                : ColorConstants.colorCustomButtonMv,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15),
                      child: Text(
                        'CONFIRMER',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: (context.watch<Reseaux>().reseau == "Togocom")
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
