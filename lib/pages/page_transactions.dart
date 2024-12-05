import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mob_se/pages/menu_transactions/page_achat_credit.dart';
import 'package:mob_se/pages/menu_transactions/page_depot.dart';
import 'package:mob_se/pages/menu_transactions/page_retrait.dart';
import 'package:provider/provider.dart';
import '../constants/color_constants.dart';
import '../constants/reseaux.dart';
import 'package:mob_se/lib/make_call.dart';

import 'menu_transactions/page_transfert_credit.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Transactions",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            Divider(
              height: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
              thickness: 1,
            ),

            // la row suivante contient la colonne envoie d'argent et retrait d'argent
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Envoie d'argent
                Expanded(
                  child: SizedBox(
                    //width: 150,
                    height: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                      const PageDepot()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              (context.watch<Reseaux>().reseau == "Yas")
                                  ? ColorConstants.colorCustomButtonTg
                                  : ColorConstants.colorCustomButtonMv,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.install_mobile,
                              size: 40,
                              color: (context.watch<Reseaux>().reseau == "Yas")
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Envoi',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color:
                                    (context.watch<Reseaux>().reseau == "Yas")
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(width: 20),

                // Retrait d'argent
                Expanded(
                  child: SizedBox(
                    //width: 150,
                    height: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (BuildContext context) =>
                                      const PageRetrait()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              (context.watch<Reseaux>().reseau == "Yas")
                                  ? ColorConstants.colorCustomButtonTg
                                  : ColorConstants.colorCustomButtonMv,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.attach_money_outlined,
                              size: 40,
                              color: (context.watch<Reseaux>().reseau == "Yas")
                                  ? Colors.black
                                  : Colors.white,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Retrait',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color:
                                    (context.watch<Reseaux>().reseau == "Yas")
                                        ? Colors.black
                                        : Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),

            // Cette row contient les colonnes achats d'unités et transfert de credit
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Achat d'unités

                  Expanded(
                    child: SizedBox(
                      height: 130,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const PageAchatCredit()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (context.watch<Reseaux>().reseau == "Yas")
                                    ? ColorConstants.colorCustomButtonTg
                                    : ColorConstants.colorCustomButtonMv,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.ad_units,
                                size: 40,
                                color:
                                    (context.watch<Reseaux>().reseau == "Yas")
                                        ? Colors.black
                                        : Colors.white,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Achats d'unités",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      (context.watch<Reseaux>().reseau == "Yas")
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(width: 20),

                  // Transfert de credit
                  Expanded(
                    child: SizedBox(
                      //width: 150,
                      height: 130,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (BuildContext context) =>
                                        const PageTransfertCredit()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                (context.watch<Reseaux>().reseau == "Yas")
                                    ? ColorConstants.colorCustomButtonTg
                                    : ColorConstants.colorCustomButtonMv,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.send_to_mobile,
                                size: 40,
                                color:
                                    (context.watch<Reseaux>().reseau == "Yas")
                                        ? Colors.black
                                        : Colors.white,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Transfert crédit',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color:
                                      (context.watch<Reseaux>().reseau == "Yas")
                                          ? Colors.black
                                          : Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: ElevatedButton(
                    onPressed: () {
                      (Provider.of<Reseaux>(context, listen: false).reseau ==
                              "Yas")
                          ? Platform.isAndroid
                              ? FlutterPhoneDirectCaller.callNumber("*145*8*4#")
                              : makePhoneCall("*145*8*4#")
                          : Platform.isAndroid
                              ? FlutterPhoneDirectCaller.callNumber("*155*1*4#")
                              : makePhoneCall("*155*1*4#");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (context.watch<Reseaux>().reseau == "Yas")
                              ? ColorConstants.colorCustomButtonTg
                              : ColorConstants.colorCustomButtonMv,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cancel,
                          size: 40,
                          color: (context.watch<Reseaux>().reseau == "Yas")
                              ? Colors.black
                              : Colors.white,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Annulation',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: (context.watch<Reseaux>().reseau == "Yas")
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
