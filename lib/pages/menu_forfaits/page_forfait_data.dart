import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';
import 'package:mob_se/widgets/custum_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../constants/reseaux.dart';
import 'package:mob_se/lib/make_call.dart';

class ForfaitDataPage extends StatelessWidget {
  const ForfaitDataPage({super.key});

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
      appBar: AppBar(
        title: const Text(
          "Forfaits internet",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: (context.watch<Reseaux>().reseau == "Yas")
                    ? ColorConstants.colorCustomButtonTg
                    : ColorConstants.colorCustomButtonMv,
              ),
              onPressed: () {
                (Provider.of<Reseaux>(context, listen: false).reseau == "Yas")
                    ? Platform.isAndroid
                        ? FlutterPhoneDirectCaller.callNumber(
                            Constantes.soldeTogocom[0].codeNormal)
                        : makePhoneCall(Constantes.soldeTogocom[0].codeNormal)
                    : Platform.isAndroid
                        ? FlutterPhoneDirectCaller.callNumber(
                            Constantes.soldeMoov[0].codeNormal)
                        : makePhoneCall(Constantes.soldeMoov[0].codeNormal);
              },
              child: Text(
                "Solde",
                style: TextStyle(
                  color: (context.watch<Reseaux>().reseau == "Yas")
                      ? Colors.black
                      : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Expanded(
              child: SizedBox(
                height: 700,
                child: ListView.builder(
                  itemCount: (context.watch<Reseaux>().reseau == "Yas")
                      ? Constantes.forfaitsInternetTogocom.length
                      : Constantes.forfaitsInternetMoov.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = (context.watch<Reseaux>().reseau == "Yas")
                        ? Constantes.forfaitsInternetTogocom[index]
                        : Constantes.forfaitsInternetMoov[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 28),
                      child: SizedBox(
                        height: 65,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (context.watch<Reseaux>().reseau == "Yas")
                                    ? ColorConstants.colorCustomButtonTg
                                    : ColorConstants.colorCustomButtonMv,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          onPressed: () {
                            callButtomSheet(
                                context,
                                '',
                                '',
                                item.validite,
                                item.prix,
                                item.codeMMCredit,
                                item.codeAutruiCredit,
                                item.codeMoneyMM,
                                item.codeMoneyAutruit,
                                item.mega,
                                item.typeforfait);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.language,
                                        color:
                                            (context.watch<Reseaux>().reseau ==
                                                    "Yas")
                                                ? Colors.black
                                                : Colors.white,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        item.mega,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: (context
                                                        .watch<Reseaux>()
                                                        .reseau ==
                                                    "Yas")
                                                ? Colors.black
                                                : Colors.white),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    item.validite,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: (context.watch<Reseaux>().reseau ==
                                              "Yas")
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                item.prix,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color:
                                      (context.watch<Reseaux>().reseau == "Yas")
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
