import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:provider/provider.dart';

import '../../constants/reseaux.dart';
import '../../widgets/contact_search.dart';
import '../../widgets/custom_bottom_sheet_envoi.dart';

bool? isChecked = false;
final _numeroController = TextEditingController();
final FocusNode _numeroControllerFocusNode = FocusNode();
final _montantController = TextEditingController();
final FocusNode _montantFocusNode = FocusNode();
bool _isSelected = false;
bool fraisVisible = false;
int frt = 0;
int mnt = 0;
int ftrn = 0;

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    super.key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(label),
          Checkbox(
            activeColor: (context.watch<Reseaux>().reseau == "Togocom")
                ? ColorConstants.colorCustomButtonTg
                : ColorConstants.colorCustomButtonMv,
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
        ],
      ),
    );
  }
}

class PageDepot extends StatelessWidget {
  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  const PageDepot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Stack(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    returnBack(context),
                    const Text(
                      "Envoi",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Numéro',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ), //place pour positionner le textfield
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
                                  onChanged: (text) {
                                    if (text == '') {
                                      text = '0';
                                    } else {
                                      int fraisRetrait, fraisTransfert;
                                      int montant = int.parse(
                                          text.replaceAll(RegExp(r'\D'), ""));

                                      setState(() {
                                        (fraisTransfert, fraisRetrait) =
                                            quelFraisTransactionEtRetrait(
                                                context, montant);
                                        frt = fraisRetrait;
                                        ftrn = fraisTransfert;
                                        //print(frt);
                                        //print(fraisRetrait);
                                        //print(montant);
                                        mnt = montant;
                                      });
                                    }
                                  },
                                  controller: _montantController,
                                  focusNode: _montantFocusNode,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      // contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: (context
                                                      .watch<Reseaux>()
                                                      .reseau ==
                                                  "Togocom")
                                              ? ColorConstants
                                                  .colorCustomButton2
                                              : ColorConstants
                                                  .colorCustomButtonMv,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: LabeledCheckbox(
                                label: 'Ajouter les frais de retraits',
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                value: _isSelected,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    _isSelected = newValue;
                                    fraisVisible = !fraisVisible;
                                  });
                                },
                              ),
                            ),
                            Visibility(
                                visible: fraisVisible, child: Text('$frt'))
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: Center(
                      child: SizedBox(
                          width: double.maxFinite,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                if (_montantController.text == '') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un montant')));
                                  _montantFocusNode.requestFocus();
                                } else {
                                  String num = _numeroController.text
                                      .replaceAll(RegExp(r'\D'), "");
                                  num = num.substring(num.length - 8);

                                  int fraisRetrait, fraisTransfert;
                                  int montant = int.parse(_montantController
                                      .text
                                      .replaceAll(RegExp(r'\D'), ""));
                                  if (_isSelected == false) {
                                    fraisTransfert =
                                        quelFraisTransaction(context, montant);
                                    fraisRetrait = 0;
                                  } else {
                                    (fraisTransfert, fraisRetrait) =
                                        quelFraisTransactionEtRetrait(
                                            context, montant);
                                  }

                                  if (num[0] == '9' || num[0] == '7') {
                                    callButtomSheetEnvoie(
                                            context,
                                            num,
                                            montant,
                                            fraisTransfert,
                                            fraisRetrait,
                                            _isSelected)
                                        .whenComplete(() {
                                      setState(
                                        () {
                                          _numeroController.clear();
                                          _montantController.clear();
                                          _isSelected = false;
                                          fraisVisible = false;
                                        },
                                      );
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        content: (Provider.of<Reseaux>(context,
                                                        listen: false)
                                                    .reseau ==
                                                "Togocom")
                                            ? const Text(
                                                'Veuillez renseigner un numéro Togocom')
                                            : const Text(
                                                'Veuillez renseigner un numéro Moov')));
                                    //print(_numeroController.text);
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    (context.watch<Reseaux>().reseau ==
                                            "Togocom")
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
                                color: (context.watch<Reseaux>().reseau ==
                                        "Togocom")
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 135, // Adjust this position based on your layout
                left: 0,
                right: 0,
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ContactFloatingList(
                    controller: _numeroController,
                    onContactSelected: (Contact? contact) {
                      _numeroController.text =
                          contact?.phones?[0].value as String;
                      // Do something with the selected contact
                      if (kDebugMode) {
                        print(
                            'Selected contact: ${contact?.displayName}, ${contact?.phones?[0].value}, ${_numeroController.text}');
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

//logic derriere ce code
(int tranfert, int retrait) quelFraisTransactionEtRetrait(
    BuildContext context, int montant) {
  if (Provider.of<Reseaux>(context, listen: false).reseau == "Togocom") {
    var newMontant = montantTransfererPlusFrais(context, montant);
    if (newMontant > 0 && newMontant <= 500) {
      return (5, 45);
    } else if (newMontant > 500 && newMontant <= 1000) {
      return (5, 70);
    } else if (newMontant > 1000 && newMontant <= 5000) {
      return (10, 90);
    } else if (newMontant > 5000 && newMontant <= 15000) {
      return (30, 250);
    } else if (newMontant > 15000 && newMontant <= 20000) {
      return (30, 290);
    } else if (newMontant > 20000 && newMontant <= 50000) {
      return (50, 550);
    } else if (newMontant > 50000 && newMontant <= 100000) {
      return (100, 900);
    } else {
      return (0, 666);
    }
  } else {
    var newMontant = montantTransfererPlusFrais(context, montant);
    if (newMontant > 0 && newMontant <= 500) {
      return (0, 50);
    } else if (newMontant > 500 && newMontant <= 1000) {
      return (0, 75);
    } else if (newMontant > 1000 && newMontant <= 5000) {
      return (0, 100);
    } else if (newMontant > 5000 && newMontant <= 15000) {
      return (0, 280);
    } else if (newMontant > 15000 && newMontant <= 20000) {
      return (0, 320);
    } else if (newMontant > 20000 && newMontant <= 50000) {
      return (0, 600);
    } else if (newMontant > 50000 && newMontant <= 100000) {
      return (0, 1000);
    } else {
      return (0, 0);
    }
  }
}

int quelFraisTransaction(BuildContext context, int montant) {
  if (Provider.of<Reseaux>(context, listen: false).reseau == "Togocom") {
    if (montant > 0 && montant <= 500) {
      return 5;
    } else if (montant > 500 && montant <= 1000) {
      return 5;
    } else if (montant > 1000 && montant <= 5000) {
      return 10;
    } else if (montant > 5000 && montant <= 15000) {
      return 30;
    } else if (montant > 15000 && montant <= 20000) {
      return 30;
    } else if (montant > 20000 && montant <= 50000) {
      return 50;
    } else if (montant > 50000 && montant <= 100000) {
      return 100;
    } else {
      return 0;
    }
  } else {
    if (montant > 0 && montant <= 500) {
      return 50;
    } else if (montant > 500 && montant <= 1000) {
      return 100;
    } else if (montant > 1000 && montant <= 5000) {
      return 280;
    } else if (montant > 15000 && montant <= 20000) {
      return 320;
    } else if (montant > 20000 && montant <= 50000) {
      return 600;
    } else if (montant > 50000 && montant <= 100000) {
      return 1000;
    } else {
      return 0;
    }
  }
}

// Montant  a transferer plus les frais de retraits
int montantTransfererPlusFrais(BuildContext context, int montantTransferer) {
  if (Provider.of<Reseaux>(context, listen: false).reseau == "Togocom") {
    if (montantTransferer > 0 && montantTransferer <= 500) {
      return montantTransferer + 45;
    } else if (montantTransferer > 500 && montantTransferer <= 1000) {
      return montantTransferer + 90;
    } else if (montantTransferer > 1000 && montantTransferer <= 5000) {
      return montantTransferer + 250;
    } else if (montantTransferer > 15000 && montantTransferer <= 20000) {
      return montantTransferer + 290;
    } else if (montantTransferer > 20000 && montantTransferer <= 50000) {
      return montantTransferer + 550;
    } else if (montantTransferer > 50000 && montantTransferer <= 100000) {
      return montantTransferer + 900;
    } else {
      return 0;
    }
  } else {
    return 0;
  }
}
