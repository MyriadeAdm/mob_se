import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';
import 'package:mob_se/constants/reseaux.dart';
import 'package:mob_se/widgets/custum_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:mob_se/lib/make_call.dart';

class ForfaitVoixPage extends StatelessWidget {
  const ForfaitVoixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forfaits voix",
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
                            Constantes.soldeTogocom[1].codeNormal)
                        : makePhoneCall(Constantes.soldeTogocom[1].codeNormal)
                    : Platform.isAndroid
                        ? FlutterPhoneDirectCaller.callNumber(
                            Constantes.soldeMoov[1].codeNormal)
                        : makePhoneCall(Constantes.soldeMoov[1].codeNormal);
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 30,
              indent: 50,
              endIndent: 50,
              color: Theme.of(context).colorScheme.inversePrimary,
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
                      ? Constantes.forfaitsAppelTogocom.length
                      : Constantes.forfaitsAppelMoov.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = (context.watch<Reseaux>().reseau == "Yas")
                        ? Constantes.forfaitsAppelTogocom[index]
                        : Constantes.forfaitsAppelMoov[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 28),
                      child: SizedBox(
                        height: 70,
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
                                item.credit,
                                item.msg,
                                item.validite,
                                item.prix,
                                item.codeMMCredit,
                                item.codeAutruiCredit,
                                item.codeMoneyMM,
                                item.codeMoneyAutruit,
                                null,
                                item.typeforfait); // Ici nous faisons appel au bottomsheet en tant que action futur
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
                                        Icons.call,
                                        color:
                                            (context.watch<Reseaux>().reseau ==
                                                    "Yas")
                                                ? Colors.black
                                                : Colors.white,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        item.credit,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (context
                                                      .watch<Reseaux>()
                                                      .reseau ==
                                                  "Yas")
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    (context.watch<Reseaux>().reseau == "Yas")
                                        ? '${item.validite} + ${item.msg}'
                                        : item.validite,
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
