import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mob_se/widgets/contact_search.dart';
import 'package:provider/provider.dart';

import '../../constants/color_constants.dart';
import '../../constants/reseaux.dart';
import '../../widgets/custom_bottom_shett_transfert.dart';

final _numController = TextEditingController();
final _soldeController = TextEditingController();
final FocusNode _numControllerFocusNode = FocusNode();
final FocusNode _montantFocusNode = FocusNode();
String nom = '';

class PageTransfertCredit extends StatelessWidget {
  const PageTransfertCredit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          "Transfert de crédit",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    height: 30,
                    indent: 30,
                    endIndent: 30,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Numéro',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  // ContactFloatingList(
                  //   controller: _numController,
                  //   onContactSelected: (Contact? contact) {
                  //     _numController.text = contact?.phones?[0].value as String;
                  //     // Do something with the selected contact
                  //   },
                  // ),
                  const SizedBox(height: 15),
                  const Text(
                    'Montant',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(7),
                            ],
                            controller: _soldeController,
                            decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: (context.watch<Reseaux>().reseau ==
                                            "Yas")
                                        ? ColorConstants.colorCustomButton2
                                        : ColorConstants.colorCustomButtonMv,
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Center(
                      child: SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              /* SI Le champ numero est vide alors afficher un snackbar pour
                                    demander à l'utilisateur de de renseigner un numero 
                                    */
                              if (_numController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numControllerFocusNode.requestFocus();
                              }
                              /* SInon si Le champ solde est vide alors afficher un snackbar pour
                                    demander à l'utilisateur de de renseigner un montant 
                                    */
                              else {
                                if (_soldeController.text == '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un montant')));
                                  _montantFocusNode.requestFocus();
                                }
                                /* A ce niveau les champ numero et montant sont renseignés.
                                      On fait alors un controle sur le format du numero et du montant
                                      */
                                else {
                                  String num = _numController.text
                                      .replaceAll(RegExp(r'\D'), "");
                                  num = num.substring(num.length - 8);

                                  int montant = int.parse(_soldeController.text
                                      .replaceAll(RegExp(r'\D'), ""));

                                  /* Si le numero renseigné commence par les chiffres 9 ou 7 alors 
                                  proceder au recapitulatif de la transaction. SInon afficher un 
                                  snackBar indiquant de renseigner un numero valide
                                      */
                                  if (num[0] == '9' || num[0] == '7') {
                                    callBottomSheetCredit(
                                      context,
                                      num,
                                      nom,
                                      montant,
                                    ).whenComplete(
                                      () {
                                        _numController.clear();
                                        _soldeController.clear();
                                      },
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        content: (Provider.of<Reseaux>(context,
                                                        listen: false)
                                                    .reseau ==
                                                "Yas")
                                            ? const Text(
                                                'Veuillez renseigner un numéro Yas')
                                            : const Text(
                                                'Veuillez renseigner un numéro Moov')));
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    (context.watch<Reseaux>().reseau == "Yas")
                                        ? ColorConstants.colorCustomButton2
                                        : ColorConstants.colorCustomButtonMv,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            child: Text(
                              "RECAP DE L'ENVOI",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color:
                                    (context.watch<Reseaux>().reseau == "Yas")
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 85, // Adjust this position based on your layout
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ContactFloatingList(
                controller: _numController,
                onContactSelected: (Contact? contact) {
                  _numController.text = contact?.phones?[0].value as String;
                  nom = contact?.displayName as String;
                  // Do something with the selected contact
                  if (kDebugMode) {
                    print(
                        'Selected contact: ${contact?.displayName}, ${contact?.phones?[0].value}, ${_numController.text}');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
