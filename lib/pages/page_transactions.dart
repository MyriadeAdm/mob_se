import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob_se/pages/menu_transactions/page_achat_credit.dart';
import 'package:mob_se/pages/menu_transactions/page_annulation.dart';
import 'package:mob_se/pages/menu_transactions/page_depot.dart';
import 'package:mob_se/pages/menu_transactions/page_retrait.dart';
import 'package:provider/provider.dart';

import '../constants/color_constants.dart';
import '../constants/reseaux.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left:20, right:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transactions",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
        
              const Divider(
                height: 60,
                // indent: 50,
                // endIndent: 50,
                color: Colors.black,
                thickness: 1,
              ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                          backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
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
                              color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Envoi',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
      
                const SizedBox(width: 20),
        
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
                          backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
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
                              color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Retrait',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),



            Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: ElevatedButton(
                        onPressed: () {
                         Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  const PageAchatcredit()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.ad_units,
                              size: 40,
                              color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Achats d'unités",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),


            
            Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: ElevatedButton(
                        onPressed: () {
                         Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  const PageAnnulation()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel,
                              size: 40,
                              color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Annulation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
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