import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:mob_se/widgets/contact_search.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/reseaux.dart';
import 'package:mob_se/lib/make_call.dart';

final _codeController = TextEditingController();

class PageAnnulation extends StatefulWidget {
  const PageAnnulation({super.key});

  @override
  State<PageAnnulation> createState() => _PageAnnulationState();
}

class _PageAnnulationState extends State<PageAnnulation> {
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
          'Annulation',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: returnBack(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Code secret',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Platform.isAndroid
                    ? FlutterPhoneDirectCaller.callNumber(
                        "*145*8*4*${_codeController.text}#")
                    : makePhoneCall("*145*8*4*${_codeController.text}#");
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
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
    );
  }
}
