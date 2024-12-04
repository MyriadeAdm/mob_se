import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/constants/reseaux.dart';

import 'package:mob_se/lib/make_call.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../models/historique_database.dart';

final _codeController = TextEditingController();
final FocusNode _codeControllerFocusNode = FocusNode();

Future<void> callBottomSheetCredit(
  BuildContext context,
  String numero,
  int montantEnvoye,
) async {
  await showModalBottomSheet<dynamic>(
    showDragHandle: true,
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Envoie vers le",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ("${numero[0]}${numero[1]} ${numero[2]}${numero[3]} ${numero[4]}${numero[5]} ${numero[6]}${numero[7]}"),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(13)),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        width: 0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 25, right: 25, bottom: 20),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Montant à envoyer :"),
                          Text("$montantEnvoye F CFA"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        thickness: 0.5,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                  obscureText: true,
                  obscuringCharacter: "*",
                  controller: _codeController,
                  focusNode: _codeControllerFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Code',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_codeController.text == '') {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const AlertDialog(
                                title: Text(
                                  "Pas de code",
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  "Veuillez renseigner le code secret",
                                  textAlign: TextAlign.center,
                                ));
                          });
                      _codeControllerFocusNode.requestFocus();
                    } else {
                      if (Provider.of<Reseaux>(context, listen: false).reseau ==
                          "Yas") {
                        Platform.isAndroid
                            ? FlutterPhoneDirectCaller.callNumber(
                                "*909*5*2$montantEnvoye*$numero*${_codeController.text}#")
                            : makePhoneCall(
                                "*909*5*2$montantEnvoye*$numero*${_codeController.text}#");
                        context.read<HistoriqueDatabase>().addHistorique(
                            "Transfert de credit Yas",
                            "Vous avez envoyé $montantEnvoye F CFA au $numero.");
                      } else {
                        Platform.isAndroid
                            ? FlutterPhoneDirectCaller.callNumber(
                                "*102*$montantEnvoye*$numero*${_codeController.text}#")
                            : makePhoneCall(
                                "*102*$montantEnvoye*$numero*${_codeController.text}#");
                        context.read<HistoriqueDatabase>().addHistorique(
                            "Transfert de credit Moov ",
                            "Vous avez envoyé $montantEnvoye F CFA au $numero.");
                      }
                    }
                    _codeController.clear();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (context.watch<Reseaux>().reseau == "Yas")
                              ? ColorConstants.colorCustomButton2
                              : ColorConstants.colorCustomButtonMv,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 15),
                    child: Text(
                      'Valider',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: (context.watch<Reseaux>().reseau == "Yas")
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
