import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';

import '../../widgets/custom_bottom_sheet_envoi.dart';

bool? isChecked = false;
final _numeroController = TextEditingController();
final _montantController = TextEditingController();
bool _isSelected = false;

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
      child: Column(
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
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        //autofocus: true,
                        controller: _numeroController,
                        decoration: InputDecoration(
                          hintText: 'Nom ou numéro de téléphone',
                          filled: true,
                          fillColor: const Color.fromRGBO(230, 227, 227, 1),
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
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.contacts_rounded,
                          color: Colors.grey, size: 40.0),
                      onPressed: () async {
                        // setState(() {
                        //   // click += 1;
                        // });

                        // Contact? contact = await _contactPicker.selectContact();
                        // if (contact != null) {
                        //   setState(() {
                        //     _contact = contact;
                        //     List<String>? phoneNumbers = contact.phoneNumbers;
                        //     selectedNumber = phoneNumbers?[0] ?? 'Nothing selected';
                        //     _numeroController.text = selectedNumber!;
                        //   });
                        // }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Montant',
                style: TextStyle(
                  fontSize: 20,
                ),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _montantController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'F CFA',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                    )
                  ],
                ),

                Directionality(
                          textDirection: TextDirection.rtl,
                          child: LabeledCheckbox(
                            label: 'Ajouter les frais de retraits',
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            value: _isSelected,
                            onChanged: (bool newValue) {
                              // setState(() {
                              //   _isSelected = newValue;
                              //   _numeroController.clear();
                              // });
                            },
                          ),
                        ),
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
            onPressed: () {
              int fraisRetrait, fraisTransfert;
              int montant = int.parse(_montantController.text.replaceAll(RegExp(r'\D'), ""));
              if (_isSelected = false) {
                (fraisTransfert, fraisRetrait) = quelFraisTransaction(montant);
              } else {
                (fraisTransfert, fraisRetrait) = quelFraisTransactionEtRetrait(montant);
              }
              callButtomSheetEnvoie(context, _numeroController.text, montant, fraisTransfert, fraisRetrait);
              },
            style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstants.colorCustomButton2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
            child: const Text(
                              'CONFIRMER',
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
    );
  }
}

(int tranfert, int retrait) quelFraisTransactionEtRetrait (int montant) {
  var newMontant = montantTransfererPlusFrais(montant);
  if (newMontant>0 && newMontant<=5000) {
    return (10, 90);
  } else if (newMontant>5000 && newMontant<=15000) {
    return (30, 250);
  } else if (newMontant>15000 && newMontant<=20000) {
    return (30, 290);
  } else if (newMontant>20000 && newMontant<=50000) {
    return (50, 550);
  } else if (newMontant>50000 && newMontant<=100000) {
    return (100, 900);
  } else {
    return (0, 0);
  }
}

(int tranfert, int retrait) quelFraisTransaction (int montant) {
  if (montant>0 && montant<=5000) {
    return (10, 90);
  } else if (montant>5000 && montant<=15000) {
    return (30, 250);
  } else if (montant>15000 && montant<=20000) {
    return (30, 290);
  } else if (montant>20000 && montant<=50000) {
    return (50, 550);
  } else if (montant>50000 && montant<=100000) {
    return (100, 900);
  } else {
    return (0, 0);
  }
}

int montantTransfererPlusFrais (int montantTransferer) {
  if (montantTransferer>0 && montantTransferer<=5000) {
    return montantTransferer + 90;
  } else if (montantTransferer>5000 && montantTransferer<=15000) {
    return montantTransferer + 250; 
  } else if (montantTransferer>15000 && montantTransferer<=20000) {
    return montantTransferer + 290; 
  } else if (montantTransferer>20000 && montantTransferer<=50000) {
    return montantTransferer + 550; 
  } else if (montantTransferer>50000 && montantTransferer<=100000) {
    return montantTransferer + 900; 
  } else {
    return 0;
  }
}
