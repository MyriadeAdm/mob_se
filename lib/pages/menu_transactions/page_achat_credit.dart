import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/widgets/custum_bottom_sheet_unite.dart';
import 'package:provider/provider.dart';
import '../../constants/reseaux.dart';
import '../../widgets/contact_search.dart';
import 'package:contacts_service/contacts_service.dart';

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
              activeColor: (context.watch<Reseaux>().reseau == "Yas")
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
final _montantController = TextEditingController();
String currentOption = options[0];
bool codeVisible = false;
bool numVisible = false;
bool boolSearch = false;

// final FlutterContactPicker _contactPicker = FlutterContactPicker();
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
      appBar: AppBar(
        title: const Text(
          "Achat d'unités",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                height: 30,
                indent: 30,
                endIndent: 30,
                color: Colors.black,
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: ListTile(
                          horizontalTitleGap: 0,
                          title: const Text(
                            'Moi-même',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          leading: Radio(
                            value: options[0],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                                numVisible = false;
                                _numeroController.clear();
                                boolSearch = false;
                              });
                            },
                            activeColor:
                                (context.watch<Reseaux>().reseau == "Yas")
                                    ? ColorConstants.colorCustomButton2
                                    : ColorConstants.colorCustomButtonMv,
                          ))),
                  Expanded(
                      child: ListTile(
                          horizontalTitleGap: 0,
                          title: const Text(
                            'Pour autrui',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          leading: Radio(
                            value: options[1],
                            groupValue: currentOption,
                            onChanged: (value) {
                              setState(() {
                                currentOption = value.toString();
                                numVisible = !numVisible;
                                boolSearch = !boolSearch;
                              });
                            },
                            activeColor:
                                (context.watch<Reseaux>().reseau == "Yas")
                                    ? ColorConstants.colorCustomButton2
                                    : ColorConstants.colorCustomButtonMv,
                          ))),
                ],
              ),
              Visibility(
                  visible: numVisible,
                  child: const SizedBox(
                    height: 60,
                  )),
              (context.watch<Reseaux>().reseau == "Yas")
                  ? Column(
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
                            creditColumn(context, 200, '200'),
                            const SizedBox(width: 10),
                            creditColumn(context, 500, '500'),
                            const SizedBox(width: 10),
                            creditColumn(context, 1000, '1.000'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            creditColumn(context, 2000, '2.000'),
                            const SizedBox(width: 10),
                            creditColumn(context, 4500, '4.500'),
                            const SizedBox(width: 10),
                            creditColumn(context, 9000, '9.000'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            creditColumn(context, 22500, '22.500'),
                            const SizedBox(width: 10),
                            creditColumn(context, 45000, '45.000'),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                        borderSide: BorderSide(
                                          color: (context
                                                      .watch<Reseaux>()
                                                      .reseau ==
                                                  "Yas")
                                              ? ColorConstants
                                                  .colorCustomButtonTg
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
                        const SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: SizedBox(
                              width: double.maxFinite,
                              height: 52,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_montantController.text == "") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(milliseconds: 500),
                                      content: Text(
                                          'Veuillez renseigner un montant'),
                                    ));
                                  } else {
                                    if (currentOption == options[0]) {
                                      String num = _numeroController.text = '';
                                      callButtomSheetUnite(
                                          context,
                                          num,
                                          int.parse(_montantController.text),
                                          false);
                                    } else {
                                      if (currentOption == options[1] &&
                                          _numeroController.text == '') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            duration:
                                                Duration(milliseconds: 500),
                                            content: Text(
                                                'Veuillez renseigner un numéro'),
                                          ),
                                        );
                                        _numeroControllerFocusNode
                                            .requestFocus();
                                      } else {
                                        String num = _numeroController.text
                                            .replaceAll(RegExp(r'\D'), "");
                                        num = num.substring(num.length - 8);

                                        if (num[0] == '9' || num[0] == '7') {
                                          callButtomSheetUnite(
                                              context,
                                              num,
                                              int.parse(
                                                  _montantController.text),
                                              true);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 500),
                                              content: Text(
                                                  'Veuillez renseigner un numéro correct'),
                                            ),
                                          );
                                        }
                                      }
                                    }
                                  }

                                  _montantController.clear();
                                  _numeroController.clear();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: (context
                                                .watch<Reseaux>()
                                                .reseau ==
                                            "Yas")
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
                                            "Yas")
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
            ],
          ),
        ),
        Visibility(
          visible: boolSearch,
          child: Positioned(
            top: 100, // Adjust this position based on your layout
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ContactFloatingList(
                controller: _numeroController,
                onContactSelected: (Contact? contact) {
                  _numeroController.text = contact?.phones?[0].value as String;
                  // Do something with the selected contact
                  if (kDebugMode) {
                    print(
                        'Selected contact: ${contact?.displayName}, ${contact?.phones?[0].value}, ${_numeroController.text}');
                  }
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

Widget creditColumn(
    BuildContext context, int montantArg, String montantAfficher) {
  return Expanded(
    child: SizedBox(
      height: 100,
      child: TextButton(
        onPressed: () {
          _numeroControllerFocusNode.unfocus();
          montant = montantArg;
          if (currentOption == options[0]) {
            String num = _numeroController.text = '';
            callButtomSheetUnite(context, num, montant, false);
          } else {
            if (currentOption == options[1] && _numeroController.text == '') {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('Veuillez renseigner un numéro')));
              _numeroControllerFocusNode.requestFocus();
            } else {
              String num = _numeroController.text.replaceAll(RegExp(r'\D'), "");
              num = num.substring(num.length - 8);

              if (num[0] == '9' || num[0] == '7') {
                callButtomSheetUnite(context, num, montant, true);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(milliseconds: 500),
                    content: Text('Veuillez renseigner un numéro correct')));
              }
            }
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(13),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            side: BorderSide(
                style: BorderStyle.solid,
                width: 1.5,
                color: (context.watch<Reseaux>().reseau == "Yas")
                    ? ColorConstants.colorCustomButton2
                    : ColorConstants.colorCustomButtonMv),
          ),
        ),
        child: Text(
          montantAfficher,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
