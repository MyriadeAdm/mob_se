import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import '../../constants/color_constants.dart';
import '../../constants/constantes.dart';
import '../../constants/reseaux.dart';
import 'package:mob_se/lib/make_call.dart';
import '../../widgets/custum_bottom_sheet.dart';

class ForfaitNuitPage extends StatelessWidget {
  const ForfaitNuitPage({super.key});

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
          "Forfaits nuits",
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
                            Constantes.soldeTogocom[3].codeNormal)
                        : makePhoneCall(Constantes.soldeTogocom[3].codeNormal)
                    : Platform.isAndroid
                        ? FlutterPhoneDirectCaller.callNumber(
                            Constantes.soldeMoov[3].codeNormal)
                        : makePhoneCall(Constantes.soldeMoov[3].codeNormal);
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
                      ? Constantes.forfaitsNuitTogocom.length
                      : Constantes.forfaitsNuitMoov.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = (context.watch<Reseaux>().reseau == "Yas")
                        ? Constantes.forfaitsNuitTogocom[index]
                        : Constantes.forfaitsNuitMoov[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 30),
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
                                        size: 18,
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
                                              : Colors.white,
                                        ),
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
