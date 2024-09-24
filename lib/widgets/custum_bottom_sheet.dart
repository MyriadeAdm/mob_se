import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/models/type_forfait.dart';
import 'package:provider/provider.dart';
import '../constants/reseaux.dart';
import 'package:mob_se/lib/make_call.dart';
import '../models/historique_database.dart';

//=============================================[DEBUT} !!!besoin pour faire marcher le bottom Sheet

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
      child: Padding(
        padding: padding,
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
      ),
    );
  }
}

List<String> options = ['Crédit', 'mobilemoney'];

bool? isChecked = false;
final _numeroController = TextEditingController();
final FocusNode _numeroControllerFocusNode = FocusNode();
final _codeController = TextEditingController();
final FocusNode _codeControllerFocusNode = FocusNode();
// int click = 0;
bool _isSelected = false;
String currentOption = options[0];
bool codeVisible = false;
bool numVisible = false;
bool voirmsg = false;

final FlutterContactPicker _contactPicker = FlutterContactPicker();
// ignore: unused_element
Contact? _contact;
String? selectedNumber;
//=============================================[FIN] !!!besoin pour faire marcher le bottom Sheet

class CustumBottomSheet extends StatefulWidget {
  const CustumBottomSheet({super.key});

  @override
  State<CustumBottomSheet> createState() => _CustumBottomSheetState();
}

class _CustumBottomSheetState extends State<CustumBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}

enum TypeForfait { forfaitAppel, forfaitInternet, forfaitMixte, forfaitNuit }

// =================== CI dessous le code à modifier pour designer le BottomSheet ===============

Future<void> callButtomSheet(
    BuildContext context,
    String credit,
    String sms,
    String validite,
    String prix,
    String codeMMCredit,
    String codeAutruiCredit,
    String codeMoneyMM,
    String codeMoneyAutruit,
    var mega,
    Typeforfait typeforfait) async {
  await showModalBottomSheet<dynamic>(
    showDragHandle: true,
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: ((context) {
      return Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  String aa = credit;
                  String bb = sms;
                  String cc = validite;
                  String dd = prix;
                  String ee = codeMMCredit;
                  String ff = codeAutruiCredit;
                  var gg = mega;
                  String codemoneyMM = codeMoneyMM;
                  String codemoneyAutruit = codeMoneyAutruit;
                  if (bb == '') {
                    voirmsg = false;
                  } else {
                    voirmsg = true;
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 30, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appelInternetMixteNuit(
                                  typeforfait.name, aa, gg), // credit et mega
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Visibility(
                              visible: voirmsg,
                              child: Text(bb, //messages
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Text(cc, //validite
                                style: const TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Montant :',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  dd, //prix
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    //color: Colors.orange,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                        const Divider(
                          //color: Colors.black,
                          height: 30,
                          thickness: 2,
                          indent: 30,
                          endIndent: 30,
                        ),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: LabeledCheckbox(
                            label: 'A une autre personne',
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            value: _isSelected,
                            onChanged: (bool newValue) {
                              setState(() {
                                _isSelected = newValue;
                                numVisible = !numVisible;
                                _numeroController.clear();
                              });
                            },
                          ),
                        ),

                        Visibility(
                          visible: numVisible,
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextField(
                                  autofocus: true,
                                  controller: _numeroController,
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

                                  Contact? contact =
                                      await _contactPicker.selectContact();
                                  if (contact != null) {
                                    setState(() {
                                      _contact = contact;
                                      List<String>? phoneNumbers =
                                          contact.phoneNumbers;
                                      selectedNumber = phoneNumbers?[0] ??
                                          'Nothing selected';
                                      _numeroController.text = selectedNumber!;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        //const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: ListTile(
                                    horizontalTitleGap: 0,
                                    title: const Text('Unité'),
                                    leading: Radio(
                                      value: options[0],
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                          codeVisible = !codeVisible;
                                          _codeControllerFocusNode.unfocus();
                                          _codeController.clear();
                                        });
                                      },
                                      activeColor: (context
                                                  .watch<Reseaux>()
                                                  .reseau ==
                                              "Togocom")
                                          ? ColorConstants.colorCustomButton2
                                          : ColorConstants.colorCustomButtonMv,
                                    ))),
                            Expanded(
                                child: ListTile(
                                    horizontalTitleGap: 0,
                                    title: (context.watch<Reseaux>().reseau ==
                                            "Togocom")
                                        ? const Text('T-money')
                                        : const Text('Flooz'),
                                    leading: Radio(
                                      value: options[1],
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                          codeVisible = !codeVisible;
                                          _codeControllerFocusNode
                                              .requestFocus();
                                        });
                                      },
                                      activeColor: (context
                                                  .watch<Reseaux>()
                                                  .reseau ==
                                              "Togocom")
                                          ? ColorConstants.colorCustomButton2
                                          : ColorConstants.colorCustomButtonMv,
                                    ))),
                          ],
                        ),
                        //const SizedBox(height: 20),
                        Visibility(
                          visible: codeVisible,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Code',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                height: 35,
                                child: TextField(
                                  autofocus: true,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(4),
                                  ],
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  //onChanged: (){},
                                  obscuringCharacter: "*",
                                  controller: _codeController,
                                  focusNode: _codeControllerFocusNode,
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
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          width: 180,
                          //child: CustomButton(label: 'Confirmer'),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    (context.watch<Reseaux>().reseau ==
                                            "Togocom")
                                        ? ColorConstants.colorCustomButton2
                                        : ColorConstants.colorCustomButtonMv,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () async {
                              /* option achat pour moi-même via credit */
                              if (_isSelected == false &&
                                  currentOption == options[0]) {
                                Platform.isAndroid
                                    ? FlutterPhoneDirectCaller.callNumber(ee)
                                    : makePhoneCall(ee);

                                context
                                    .read<HistoriqueDatabase>()
                                    .addHistorique(
                                        typeForfait(typeforfait.name),
                                        typeForfaitDetails(typeforfait.name, aa,
                                            bb, cc, dd, gg));

                                /* option achat pour autrui via credit */
                              } else if (_isSelected == true &&
                                  currentOption == options[0]) {
                                var num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");

                                if (num != '') {
                                  num = num.substring(num.length - 8);

                                  if (Provider.of<Reseaux>(context,
                                              listen: false)
                                          .reseau ==
                                      "Togocom") {
                                    Platform.isAndroid
                                        ? FlutterPhoneDirectCaller.callNumber(
                                            "*909*7*$num$ff")
                                        : makePhoneCall("*909*7*$num$ff");
                                    context
                                        .read<HistoriqueDatabase>()
                                        .addHistorique(
                                          typeForfait(typeforfait.name),
                                          typeForfaitDetailsNumero(
                                              typeforfait.name,
                                              aa,
                                              bb,
                                              cc,
                                              dd,
                                              gg,
                                              num),
                                        );
                                  } else {
                                    // TODO faire apparaitre un toast pour signaler que cette option n'existe pas pour le reseau moov
                                  }
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AlertDialog(
                                            title: Text(
                                              "Pas de numéro",
                                              textAlign: TextAlign.center,
                                            ),
                                            content: Text(
                                              "Veuillez renseigner le numéro",
                                              textAlign: TextAlign.center,
                                            ));
                                      });

                                  _numeroControllerFocusNode.requestFocus;
                                }
                              }

                              /* option achat pour moi meme via mobile money */
                              else if (_isSelected == false &&
                                  currentOption == options[1]) {
                                Platform.isAndroid
                                    ? FlutterPhoneDirectCaller.callNumber(
                                        "$codemoneyMM${_codeController.text}#")
                                    : makePhoneCall(
                                        "$codemoneyMM${_codeController.text}#");

                                context
                                    .read<HistoriqueDatabase>()
                                    .addHistorique(
                                        typeForfaitMobileMoney(
                                            typeforfait.name),
                                        typeForfaitDetails(typeforfait.name, aa,
                                            bb, cc, dd, gg));
                              }

                              /* option achat pour autrui via mobile money */
                              else if (_isSelected == true &&
                                  currentOption == options[1]) {
                                var num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");

                                if (num != '') {
                                  num = num.substring(num.length - 8);

                                  if (context.watch<Reseaux>().reseau ==
                                      "Togocom") {
                                    Platform.isAndroid
                                        ? FlutterPhoneDirectCaller.callNumber(
                                            "*909*7*$num$codemoneyAutruit${_codeController.text}#")
                                        : makePhoneCall(
                                            "*909*7*$num$codemoneyAutruit${_codeController.text}#");
                                  } else {
                                    Platform.isAndroid
                                        ? FlutterPhoneDirectCaller.callNumber(
                                            "$codeMoneyAutruit$num*${_codeController.text}#")
                                        : makePhoneCall(
                                            "$codeMoneyAutruit$num*${_codeController.text}#");
                                  }

                                  context
                                      .read<HistoriqueDatabase>()
                                      .addHistorique(
                                        typeForfaitMobileMoney(
                                            typeforfait.name),
                                        typeForfaitDetailsNumero(
                                            typeforfait.name,
                                            aa,
                                            bb,
                                            cc,
                                            dd,
                                            gg,
                                            num),
                                      );
                                }
                              }
                            },
                            child: Text(
                              'CONFIRMER',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: (context.watch<Reseaux>().reseau ==
                                        "Togocom")
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }),
  ).whenComplete(reset);
}

void reset() {
  _numeroController.clear();
  isChecked = false;
  _isSelected = false;
  currentOption = options[0];
  codeVisible = false;
  numVisible = false;
  _codeController.clear();
}

String appelInternetMixteNuit(String typeForfait, dynamic aa, dynamic gg) {
  switch (typeForfait) {
    case "forfaitAppel":
      return "$aa";

    case "forfaitInternet":
      return "$gg";

    case "forfaitMixte":
      return "$aa + $gg";

    case "forfaitNuit":
      return "$gg";

    default:
      return "error";
  }
}

String typeForfait(String typeForfait) {
  switch (typeForfait) {
    case "forfaitAppel":
      return "Forfait Appel";

    case "forfaitInternet":
      return "Forfait Internet";

    case "forfaitMixte":
      return "Forfait Mixte";

    case "forfaitNuit":
      return "Forfait Nuit";

    default:
      return "error";
  }
}

String typeForfaitMobileMoney(String typeForfait) {
  switch (typeForfait) {
    case "forfaitAppel":
      return "Forfait Appel : T-Money";

    case "forfaitInternet":
      return "Forfait Internet : T-Money";

    case "forfaitMixte":
      return "Forfait Mixte  : T-Money";

    case "forfaitNuit":
      return "Forfait Nuit : T-Money";

    default:
      return "error";
  }
}

String typeForfaitDetails(String typeForfait, aa, bb, cc, dd, gg) {
  switch (typeForfait) {
    case "forfaitAppel":
      return "$aa $bb, $cc - $dd";

    case "forfaitInternet":
      return "$gg, $cc - $dd";

    case "forfaitMixte":
      return "$aa + $gg, $bb, $cc - $dd";

    case "forfaitNuit":
      return "$gg, $cc - $dd";

    default:
      return "error";
  }
}

String typeForfaitDetailsNumero(
    String typeForfait, aa, bb, cc, dd, gg, numero) {
  switch (typeForfait) {
    case "forfaitAppel":
      return "$aa $bb à $numero, $cc - $dd";

    case "forfaitInternet":
      return "$gg à $numero, $cc - $dd";

    case "forfaitMixte":
      return "$aa + $gg à $numero, $bb, $cc - $dd";

    case "forfaitNuit":
      return "$gg à $numero, $cc - $dd";

    default:
      return "error";
  }
}
