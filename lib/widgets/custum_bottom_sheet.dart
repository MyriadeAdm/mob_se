import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';

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
              activeColor: ColorConstants.colorCustomButton,
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
final _textController = TextEditingController();
int click = 0;
bool _isSelected = false;
String currentOption = options[0];
bool codeVisible = false;
bool numVisible = false;
//=============================================[FIN] !!!besoin pour faire marcher le bottom Sheet


class CustumBottomSheet extends StatelessWidget {
  const CustumBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}


// =================== CI dessous le code à modifier pour designer le BottomSheet ===============

Future<void> callButtomSheet(BuildContext context, String a) async {
  await showModalBottomSheet<dynamic>(
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: ((context) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              String $aa= a;
              return Padding(
                padding: const EdgeInsets.only(
                    right: 30, left: 30, top: 30, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          $aa, 
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text('SMS',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                        const Text('Validite ',
                            style: TextStyle(
                                fontSize: 13.5, fontWeight: FontWeight.w400)),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Montant',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'prix',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                //color: Colors.orange,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const Divider(
                      height: 30,
                      thickness: 2,
                      indent: 30,
                      endIndent: 30,
                    ),
          
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: LabeledCheckbox(
                        label: 'A une autre personne',
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: _isSelected,
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected = newValue;
                            numVisible = !numVisible;
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
                              controller: _textController,
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
                                    _textController.clear();
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
                            onPressed: () {
                              setState(() {
                                click += 1;
                              });
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
                                title: const Text('Credit'),
                                leading: Radio(
                                  value: options[0],
                                  groupValue: currentOption,
                                  onChanged: (value) {
                                    setState(() {
                                      currentOption = value.toString();
                                      codeVisible = !codeVisible;
                                    });
                                  },
                                  activeColor: Colors.amber,
                                ))),
                        Expanded(
                            child: ListTile(
                              horizontalTitleGap: 0,
                                title: const Text('T-money'),
                                leading: Radio(
                                  value: options[1],
                                  groupValue: currentOption,
                                  onChanged: (value) {
                                    setState(() {
                                      currentOption = value.toString();
                                      codeVisible = !codeVisible;
                                    });
                                  },
                                  activeColor: Colors.amber,
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
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              //onChanged: (){},
                              obscuringCharacter: "*",
                              controller: TextEditingController(),
                              decoration: InputDecoration(
                                filled: true,
                                //hintText: '',
                                fillColor: const Color.fromRGBO(230, 227, 227, 1),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // suffixIcon: IconButton(
                                //   onPressed: () {
                                //     _textController.clear();
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
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          if (_isSelected == false && currentOption == options[0]) {
                // TODO code à completer lorsque l'utilisateur achête du crédit 
                            // pour lui même avec son crédit

                            /* Utiliser le code normal de l'objet forfait_appel pour
                            lancer un call natif sur le terminal mobile */
                          }
                        },
                        child: const Text(
                          'CONFIRMER',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
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
      );
    }),
  );
}