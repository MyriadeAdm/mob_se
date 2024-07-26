import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            indent: 80,
            endIndent: 80,
            color: Colors.black,
            thickness: 1.5,
          ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  //width: 150,
                  height: 130,
                  child: ElevatedButton(
                      onPressed: () { },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.colorCustomButton,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.install_mobile,
                            size: 40,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Depot',
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

              const SizedBox(width: 20),
      
              Expanded(
                child: SizedBox(
                  //width: 150,
                  height: 130,
                  child: ElevatedButton(
                      onPressed: () { },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.colorCustomButton,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.send_to_mobile,
                            size: 40,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Retrait',
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
      
          
          Padding(
                padding: const EdgeInsets.only(top:25.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
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
                            Icons.cancel,
                            size: 40,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Annulation',
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
    );
  }
}