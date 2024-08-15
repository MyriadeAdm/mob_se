import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/models/historique_database.dart';
import 'package:info_popup/info_popup.dart';
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

List<String> options = ['Crédit', 'mobilemoney'];

bool? isChecked = false;
final _numeroController = TextEditingController();
final FocusNode _numeroControllerFocusNode = FocusNode();
final _codeController = TextEditingController();
final FocusNode _codeControllerFocusNode = FocusNode();
final _montantController = TextEditingController();

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
                        title: const Text('Moi meme'),
                        leading: Radio(
                          value: options[0],
                          groupValue: currentOption,
                          onChanged: (value) {
                            setState(() {
                              currentOption = value.toString();
                              numVisible = false;
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
<<<<<<< HEAD:lib/pages/menu_transactions/page_achatCredit.dart
                DropdownSearch<int>(
                  mode: Mode.MENU,
                  showSelectedItems: true,
                  items: const [200,500,1000,2000,4500,9000,22500,45000],
                  dropdownSearchDecoration: const InputDecoration(
                    hintText: 'Faites un choix'
                  ),
                  onChanged: ItemSelectionChanged,
                  searchFieldProps:
                ),


                const Text(
                  'Montant',
                  style: TextStyle(
                    fontSize: 20,
                  ),
=======
                 const Row(
                  children: [
                    Text(
                      'Montant',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    InfoPopupWidget(
                      contentTitle: '''
Montants autorisés:
Recharge 200
Recharge 500
Recharge 1000
Recharge 2000
Recharge 4500
Recharge 9000
Recharge 22500
Recharge 45000''',
                      child: Icon(
                        Icons.info,
                        color: Colors.pink,
                      ),
                    ),
                  ],
>>>>>>> a32527b7f53d247dd06508f21f461a3db8e25c6d:lib/pages/menu_transactions/page_achat_credit.dart
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Code secret',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        //autofocus: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4),
                        ],
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        //onChanged: (){},
                        obscuringCharacter: "*",
                        controller: _codeController,
                        //focusNode: _codeControllerFocusNode,
                        decoration: InputDecoration(
                          filled: true,
                          //hintText: '',
                          fillColor: const Color.fromRGBO(230, 227, 227, 1),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          letterSpacing: 8.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  var montant = _montantController.text;
                  var codeSecret = _codeController.text;

                  if (montant == '' || int.parse(montant) <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Veuillez renseigner un montant')));
                  } else {
                    if (codeSecret == '') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Veuillez renseigner votre code')));
                    } else {
                      FlutterPhoneDirectCaller.callNumber(
                          "*145*3**1*1*choix**$codeSecret#");

                      context.read<HistoriqueDatabase>().addHistorique(
                          "Retrait", "$montant F CFA retiré chez l'agent.");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        (context.watch<Reseaux>().reseau == "Togocom")
                            ? ColorConstants.colorCustomButton2
                            : ColorConstants.colorCustomButtonMv,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15),
                  child: Text(
                    'CONFIRMER',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: (context.watch<Reseaux>().reseau == "Togocom")
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
