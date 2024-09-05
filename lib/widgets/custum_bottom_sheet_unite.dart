import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../models/historique_database.dart';

final _codeController = TextEditingController();
final FocusNode _codeControllerFocusNode = FocusNode();
String intitule = '';
String numOui = '';
bool numVisible = true;
int choixMontant = 0;

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Future<void> callButtomSheetUnite(
    BuildContext context,
    var numero,
    int montant,
    bool isSelected) async {
  await showModalBottomSheet<dynamic>(
    showDragHandle: true,
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: (context) {
                        if (numero != ''){
                  intitule = 'Achat de crédit pour';
                  numVisible = true;
                  numOui = "${numero[0]}${numero[1]} ${numero[2]}${numero[3]} ${numero[4]}${numero[5]} ${numero[6]}${numero[7]}";
                }else{ intitule = 'Achat de credit à';
                numOui = 'Moi-même';
                numVisible = false;}

      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Padding(
            padding: const EdgeInsets.only(bottom:30, left:30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  intitule,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  numOui,
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
                    padding: const EdgeInsets.only(
                        top: 25, left: 25, right: 25, bottom: 20),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Choix de:",
                          // style: TextStyle(
                          //   //fontSize: 20,
                          //   fontWeight: FontWeight.w500,
                          // ),
                          ),
                          Text("$montant F CFA",
                          style: const TextStyle(
                            //fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),),
                        ],
                      ),
                    ]),
                  ),
                ),
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
                    }
                    else { 

                      switch (montant) {
                          case 200:
                            choixMontant = 1;
                            break;
                          case 500:
                            choixMontant = 2;
                            break;
                          case 1000:
                            choixMontant = 3;
                            break;
                          case 2000:
                            choixMontant = 4;
                            break;
                          case 4500:
                            choixMontant = 5;
                            break;
                          case 9000:
                            choixMontant = 7;
                            break;
                          case 22500:
                            choixMontant = 8;
                            break;
                          case 45000:
                            choixMontant = 9;
                            break;
                          default:
                        }

                      if (isSelected) {

                        FlutterPhoneDirectCaller.callNumber("*145*3*1*2*$numero*$choixMontant*${_codeController.text}#");  

                        context.read<HistoriqueDatabase>()
                                      .addHistorique("Achat crédit T-Money",
                                        "$montant F CFA rechargé à $numero");

                      } else {
                         FlutterPhoneDirectCaller.callNumber("*145*3*1*1*$choixMontant*${_codeController.text}#");

                        context.read<HistoriqueDatabase>()
                                      .addHistorique("Achat crédit T-Money",
                                        "$montant F CFA rechargé à Moi-Même");
                      }
                    }
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
