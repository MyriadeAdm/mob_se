import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

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


final FlutterContactPicker _contactPicker = FlutterContactPicker();
// ignore: unused_element
Contact? _contact;
String? selectedNumber;

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
            activeColor: ColorConstants.colorCustomButton,
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
          return Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                returnBack(context),
                const Text(
                  "Envoi",
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
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            //autofocus: true,
                            controller: _numeroController,
                            focusNode: _numeroControllerFocusNode,
                            decoration: InputDecoration(
                                hintText: 'Nom ou numéro de téléphone',
                                filled: true,
                                fillColor:
                                    const Color.fromRGBO(230, 227, 227, 1),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _numeroController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: ColorConstants.colorCustomButton2,
                                  ),
                                )),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.contacts_rounded,
                              color: Colors.grey, size: 40.0),
                          onPressed: () async {
                            // setState(() {
                            //   // click += 1;
                            // });

                            Contact? contact =
                                await _contactPicker.selectContact();
                            if (contact != null) {
                              setState(() {
                                _contact = contact;
                                List<String>? phoneNumbers =
                                    contact.phoneNumbers;
                                selectedNumber =
                                    phoneNumbers?[0] ?? 'Nothing selected';
                                _numeroController.text = selectedNumber!;
                              });
                            }
                          },
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
                              focusNode: _montantFocusNode,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            value: _isSelected,
                            onChanged: (bool newValue) {
                              setState(() {
                                _isSelected = newValue;
                                fraisVisible = !fraisVisible;
                              });
                              if (_montantController.text ==''){ _montantController.text = '0';}
                              else{
                                int fraisRetrait, fraisTransfert;
                              int montant = int.parse(_montantController.text
                                  .replaceAll(RegExp(r'\D'), ""));
                              if (_isSelected == false) {
                                fraisTransfert = quelFraisTransaction(montant);
                                fraisRetrait = 0;
                              } else {
                                setState((){
                                  (fraisTransfert, fraisRetrait) =
                                    quelFraisTransactionEtRetrait(montant);
                                    frt = fraisRetrait;
                                    ftrn = fraisTransfert;
                                    mnt = montant;
                                });
                              }
                              }
                            },
                          ),
                        ),
                        
                        Visibility(
                          visible: fraisVisible,
                          child: Text('$frt'))
                        //TODO faire apparaitre le montant avant lancement
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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                      title: Text("Pas de numéro"),
                                      content: Text(
                                        "Veuillez renseigner le numéro",
                                        textAlign: TextAlign.center,
                                      ));
                                });
                            _numeroControllerFocusNode.requestFocus();
                          } else {
                            if (_montantController.text == '') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                        title: Text("Pas de montant"),
                                        content: Text(
                                          "Veuillez renseigner le montant",
                                          textAlign: TextAlign.center,
                                        ));
                                  });
                              _montantFocusNode.requestFocus();
                            } else {
                              String num = _numeroController.text
                                  .replaceAll(RegExp(r'\D'), "");
                              num = num.substring(num.length - 8);

                              ///print (num[0]);

                              // int fraisRetrait, fraisTransfert;
                              // int montant = int.parse(_montantController.text
                              //     .replaceAll(RegExp(r'\D'), ""));
                              // if (_isSelected == false) {
                              //   fraisTransfert = quelFraisTransaction(montant);
                              //   fraisRetrait = 0;
                              // } else {
                              //   (fraisTransfert, fraisRetrait) =
                              //       quelFraisTransactionEtRetrait(montant);
                              // }

                              if (num[0] == '9' || num[0] == '7') {
                                callButtomSheetEnvoie(
                                        context,
                                        num,
                                        mnt,
                                        ftrn,
                                        frt,
                                        _isSelected)
                                    .whenComplete(reset);
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const AlertDialog(
                                          title: Text("Numéro incorrect",
                                          textAlign: TextAlign.center,),
                                          content: Text(
                                            "Renseigner un numéro du Togo",
                                            textAlign: TextAlign.center,
                                          ));
                                    });
                              }
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.colorCustomButton2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Text(
                          "RECAP DE L'ENVOI",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

(int tranfert, int retrait) quelFraisTransactionEtRetrait(int montant) {
  var newMontant = montantTransfererPlusFrais(montant);
  if (newMontant > 0 && newMontant <= 5000) {
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
    return (0, 0);
  }
}

int quelFraisTransaction(int montant) {
  if (montant > 0 && montant <= 5000) {
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
}

int montantTransfererPlusFrais(int montantTransferer) {
  if (montantTransferer > 0 && montantTransferer <= 5000) {
    return montantTransferer + 90;
  } else if (montantTransferer > 5000 && montantTransferer <= 15000) {
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
}

void reset() {
  _numeroController.clear();
  _montantController.clear();
  _isSelected = false;
}
