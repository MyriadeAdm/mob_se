import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../constants/color_constants.dart';
import 'package:mob_se/lib/make_call.dart';

final _codeController = TextEditingController();
final FocusNode _codeControllerFocusNode = FocusNode();

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Future<void> callButtomSheetEnvoie(
    BuildContext context,
    String numero,
    int montantEnvoye,
    int fraisTransaction,
    int fraisRetrait,
    bool fraisVisible) async {
  await showModalBottomSheet<dynamic>(
    showDragHandle: true,
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          //height: 350,
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
                    border: Border.all(width: 0.5),
                    //color: const Color.fromRGBO(241, 240, 240, 1),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Frais de transaction :"),
                          Text("$fraisTransaction F CFA"),
                        ],
                      ),
                      Visibility(
                        visible: fraisVisible,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Frais de retrait :"),
                            Text("$fraisRetrait F CFA"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        thickness: 0.5,
                        color: Colors.black,
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
                            "${montantEnvoye + fraisTransaction + fraisRetrait} F CFA",
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
                    hintText: 'Code secret',
                    filled: true,
                    fillColor: const Color.fromRGBO(230, 227, 227, 1),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    //print ('le code est *${_codeController.text}*');
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
                      fraisVisible
                          ? Platform.isAndroid
                              ? FlutterPhoneDirectCaller.callNumber(
                                  "*145*1*$montantEnvoye*$numero*1*${_codeController.text}#")
                              : makePhoneCall(
                                  "*145*1*$montantEnvoye*$numero*1*${_codeController.text}#")
                          : Platform.isAndroid
                              ? FlutterPhoneDirectCaller.callNumber(
                                  "*145*1*$montantEnvoye*$numero*2*${_codeController.text}#")
                              : makePhoneCall(
                                  "*145*1*$montantEnvoye*$numero*2*${_codeController.text}#");
                    }
                    _codeController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.colorCustomButton2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                    child: Text(
                      'Valider',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
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
  ).whenComplete(reset);
}

void reset() {
  _codeController.clear();
}
