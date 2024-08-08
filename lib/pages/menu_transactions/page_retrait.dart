import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants/color_constants.dart';

final _numeroAgentController = TextEditingController();
final _codeController = TextEditingController();

class PageRetrait extends StatelessWidget {
  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  const PageRetrait({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  returnBack(context),
                  const Text(
                    "Retrait",
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
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30),
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Code Agent',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(5),
                                  ],
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 25,
                                    letterSpacing: 8.0,
                                    fontWeight: FontWeight.w900,
                                  )),
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
                                  controller: TextEditingController(),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    // contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
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
                          'Code',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
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
                                //focusNode: _codeControllerFocusNode,
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
                                style: const TextStyle(
                                  letterSpacing: 8.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.colorCustomButton2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text(
                      'CONFIRMER',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
