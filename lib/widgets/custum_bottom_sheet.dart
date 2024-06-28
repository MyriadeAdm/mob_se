import 'package:flutter/material.dart';

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
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
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

List<String> options = ['Crédit', 'Tmoney'];

bool? isChecked = false;
final _textController = TextEditingController();
int click = 0;
bool _isSelected = false;
String currentOption = options[0];

//=============================================[FIN} !!!besoin pour faire marcher le bottom Sheet

class CustumBottomSheet extends StatelessWidget {
  const CustumBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// =================== CI dessous le code à modifier pour designer le BottomSheet ===============

Future<void> callButtomSheet(BuildContext context) async {
  await showModalBottomSheet<dynamic>(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
    ),
    builder: ((context) {
      return Expanded(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.only(
                  right: 50, left: 50, top: 30, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'credit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('SMS',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      Text('Validite ',
                          style: TextStyle(
                              fontSize: 13.5, fontWeight: FontWeight.w400)),
                      SizedBox(height: 20),
                      Row(
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
                        });
                      },
                    ),
                  ),

                  Row(
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
                  //const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: ListTile(
                              title: const Text('Credit'),
                              leading: Radio(
                                value: options[0],
                                groupValue: currentOption,
                                onChanged: (value) {
                                  setState(() {
                                    currentOption = value.toString();
                                  });
                                },
                                activeColor: Colors.amber,
                              ))),
                      Expanded(
                          child: ListTile(
                              title: const Text('T-money'),
                              leading: Radio(
                                value: options[1],
                                groupValue: currentOption,
                                onChanged: (value) {
                                  setState(() {
                                    currentOption = value.toString();
                                  });
                                },
                                activeColor: Colors.amber,
                              ))),
                    ],
                  ),
                  //const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              borderRadius: BorderRadius.circular(13),
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
                      onPressed: () => {},
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
      );
    }),
  );
}