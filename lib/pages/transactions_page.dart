import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20,),
          child: Text(
            "Transactions",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),

        const Divider(
          height: 40,
          indent: 80,
          endIndent: 80,
          color: Colors.black,
          thickness: 1.5,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: 150,
                height: 130,
                child: ElevatedButton(
                    onPressed: () {
                     // TO DO appel au bottomSheet d'envoi d'argent
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.colorCustomButton,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.send,
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Envoi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: 150,
                height: 130,
                child: ElevatedButton(
                    onPressed: () {
                     // TO DO Ecrire la fonction d'appel au simpleDialog pour l'achat du forfait
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.colorCustomButton,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_circle_down,
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Retrait',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}