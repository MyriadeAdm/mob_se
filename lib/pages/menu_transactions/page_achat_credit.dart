import 'package:flutter/material.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/widgets/custum_bottom_sheet_unite.dart';
import 'package:provider/provider.dart';
import '../../constants/reseaux.dart';

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

List<String> options = ['MM', 'AUTRUI'];

bool? isChecked = false;
final _numeroController = TextEditingController();
final FocusNode _numeroControllerFocusNode = FocusNode();
int montant = 0;

String currentOption = options[0];
bool codeVisible = false;
bool numVisible = false;

final FlutterContactPicker _contactPicker = FlutterContactPicker();
// ignore: unused_element
Contact? _contact;
String? selectedNumber;

class PageAchatcredit extends StatefulWidget {
  const PageAchatcredit({super.key});

  @override
  State<PageAchatcredit> createState() => _PageAchatcreditState();
}

class _PageAchatcreditState extends State<PageAchatcredit> {
  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              returnBack(context),
              const Text(
                "Achats d'unités",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: ListTile(
                        horizontalTitleGap: 0,
                        title: const Text('Moi-même'),
                        leading: Radio(
                          value: options[0],
                          groupValue: currentOption,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                              numVisible = false;
                              _numeroController.clear();
                            });
                          },
                          activeColor:
                              (context.watch<Reseaux>().reseau == "Togocom")
                                  ? ColorConstants.colorCustomButton2
                                  : ColorConstants.colorCustomButtonMv,
                        ))),
                Expanded(
                    child: ListTile(
                        horizontalTitleGap: 0,
                        title: const Text('Pour autrui'),
                        leading: Radio(
                          value: options[1],
                          groupValue: currentOption,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                              numVisible = !numVisible;
                            });
                          },
                          activeColor:
                              (context.watch<Reseaux>().reseau == "Togocom")
                                  ? ColorConstants.colorCustomButton2
                                  : ColorConstants.colorCustomButtonMv,
                        ))),
              ],
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
                      focusNode: _numeroControllerFocusNode,
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

                      Contact? contact = await _contactPicker.selectContact();
                      if (contact != null) {
                        setState(() {
                          _contact = contact;
                          List<String>? phoneNumbers = contact.phoneNumbers;
                          selectedNumber =
                              phoneNumbers?[0] ?? 'Nothing selected';
                          _numeroController.text = selectedNumber!;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text('* Séléctionner le montant à envoyer',
                    style: TextStyle(
                      fontSize: 15,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            _numeroControllerFocusNode.unfocus();
                            montant = 200;
                            if (currentOption == options[0]) {
                              String num = _numeroController.text = '';
                              callButtomSheetUnite(
                                context,
                                num,
                                montant,
                              );
                            } else {
                              if (currentOption == options[1] &&
                                  _numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                String num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");
                                num = num.substring(num.length - 8);

                                ///print (num[0]);

                                if (num[0] == '9' || num[0] == '7') {
                                  callButtomSheetUnite(
                                    context,
                                    num,
                                    montant,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un numéro Togocel ou moov')));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                  color: (context.watch<Reseaux>().reseau ==
                                          "Togocom")
                                      ? ColorConstants.colorCustomButton2
                                      : ColorConstants.colorCustomButtonMv),
                            ),
                          ),
                          child: const Text(
                            "200",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            _numeroControllerFocusNode.unfocus();
                            montant = 500;
                            if (currentOption == options[0]) {
                              String num = _numeroController.text = '';
                              
                              callButtomSheetUnite(
                                context,
                                num,
                                montant,
                              );
                            } else {
                              if (currentOption == options[1] &&
                                  _numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                String num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");
                                num = num.substring(num.length - 8);

                                ///print (num[0]);

                                if (num[0] == '9' || num[0] == '7') {
                                  callButtomSheetUnite(
                                    context,
                                    num,
                                    montant,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un numéro Togocel ou moov')));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                  color: (context.watch<Reseaux>().reseau ==
                                          "Togocom")
                                      ? ColorConstants.colorCustomButton2
                                      : ColorConstants.colorCustomButtonMv),
                            ),
                          ),
                          child: const Text(
                            "500",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            _numeroControllerFocusNode.unfocus();
                            montant = 1000;
                            if (currentOption == options[0]) {
                              String num = _numeroController.text = '';
                              
                              callButtomSheetUnite(
                                context,
                                num,
                                montant,
                              );
                            } else {
                              if (currentOption == options[1] &&
                                  _numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                String num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");
                                num = num.substring(num.length - 8);

                                ///print (num[0]);

                                if (num[0] == '9' || num[0] == '7') {
                                  callButtomSheetUnite(
                                    context,
                                    num,
                                    montant,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un numéro Togocel ou moov')));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                  color: (context.watch<Reseaux>().reseau ==
                                          "Togocom")
                                      ? ColorConstants.colorCustomButton2
                                      : ColorConstants.colorCustomButtonMv),
                            ),
                          ),
                          child: const Text(
                            "1.000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            _numeroControllerFocusNode.unfocus();
                            montant = 2000;
                            if (currentOption == options[0]) {
                              String num = _numeroController.text = '';
                              
                              callButtomSheetUnite(
                                context,
                                num,
                                montant,
                              );
                            } else {
                              if (currentOption == options[1] &&
                                  _numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                String num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");
                                num = num.substring(num.length - 8);

                                ///print (num[0]);

                                if (num[0] == '9' || num[0] == '7') {
                                  callButtomSheetUnite(
                                    context,
                                    num,
                                    montant,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un numéro Togocel ou moov')));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                  color: (context.watch<Reseaux>().reseau ==
                                          "Togocom")
                                      ? ColorConstants.colorCustomButton2
                                      : ColorConstants.colorCustomButtonMv),
                            ),
                          ),
                          child: const Text(
                            "2.000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            _numeroControllerFocusNode.unfocus();
                            montant = 4500;
                            if (currentOption == options[0]) {
                              String num = _numeroController.text = '';
                              
                              callButtomSheetUnite(
                                context,
                                num,
                                montant,
                              );
                            } else {
                              if (currentOption == options[1] &&
                                  _numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                String num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");
                                num = num.substring(num.length - 8);

                                ///print (num[0]);

                                if (num[0] == '9' || num[0] == '7') {
                                  callButtomSheetUnite(
                                    context,
                                    num,
                                    montant,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un numéro Togocel ou moov')));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                  color: (context.watch<Reseaux>().reseau ==
                                          "Togocom")
                                      ? ColorConstants.colorCustomButton2
                                      : ColorConstants.colorCustomButtonMv),
                            ),
                          ),
                          child: const Text(
                            "4.500",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            _numeroControllerFocusNode.unfocus();
                            montant = 9000;
                            if (currentOption == options[0]) {
                              String num = _numeroController.text = '';
                              
                              callButtomSheetUnite(
                                context,
                                num,
                                montant,
                              );
                            } else {
                              if (currentOption == options[1] &&
                                  _numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                String num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");
                                num = num.substring(num.length - 8);

                                ///print (num[0]);

                                if (num[0] == '9' || num[0] == '7') {
                                  callButtomSheetUnite(
                                    context,
                                    num,
                                    montant,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un numéro Togocel ou moov')));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                  color: (context.watch<Reseaux>().reseau ==
                                          "Togocom")
                                      ? ColorConstants.colorCustomButton2
                                      : ColorConstants.colorCustomButtonMv),
                            ),
                          ),
                          child: const Text(
                            "9.000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            _numeroControllerFocusNode.unfocus();
                            montant = 22500;
                            if (currentOption == options[0]) {
                              String num = _numeroController.text = '';
                              
                              callButtomSheetUnite(
                                context,
                                num,
                                montant,
                              );
                            } else {
                              if (currentOption == options[1] &&
                                  _numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                String num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");
                                num = num.substring(num.length - 8);

                                ///print (num[0]);

                                if (num[0] == '9' || num[0] == '7') {
                                  callButtomSheetUnite(
                                    context,
                                    num,
                                    montant,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un numéro Togocel ou moov')));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                  color: (context.watch<Reseaux>().reseau ==
                                          "Togocom")
                                      ? ColorConstants.colorCustomButton2
                                      : ColorConstants.colorCustomButtonMv),
                            ),
                          ),
                          child: const Text(
                            "22.500",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: TextButton(
                          onPressed: () {
                            _numeroControllerFocusNode.unfocus();
                            montant = 45000;
                            if (currentOption == options[0]) {
                              String num = _numeroController.text = '';
                              
                              callButtomSheetUnite(
                                context,
                                num,
                                montant,
                              );
                            } else {
                              if (currentOption == options[1] &&
                                  _numeroController.text == '') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Veuillez renseigner un numéro')));
                                _numeroControllerFocusNode.requestFocus();
                              } else {
                                String num = _numeroController.text
                                    .replaceAll(RegExp(r'\D'), "");
                                num = num.substring(num.length - 8);

                                ///print (num[0]);

                                if (num[0] == '9' || num[0] == '7') {
                                  callButtomSheetUnite(
                                    context,
                                    num,
                                    montant,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Veuillez renseigner un numéro Togocel ou moov')));
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(13),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              side: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                  color: (context.watch<Reseaux>().reseau ==
                                          "Togocom")
                                      ? ColorConstants.colorCustomButton2
                                      : ColorConstants.colorCustomButtonMv),
                            ),
                          ),
                          child: const Text(
                            "45.000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void verif() {}
