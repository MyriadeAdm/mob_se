import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/pages/menu_forfaits/page_forfait_data.dart';
import 'package:mob_se/pages/menu_forfaits/page_forfait_mixte.dart';
import 'package:mob_se/pages/menu_forfaits/page_forfait_nuit.dart';
import 'package:mob_se/pages/menu_forfaits/page_forfait_voix.dart';
import 'package:provider/provider.dart';

import '../constants/reseaux.dart';

class ForfaitPage extends StatelessWidget {
  const ForfaitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20, right:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Achat de forfaits",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
              const Divider(
                height: 60,
                //indent: 50,
                //endIndent: 50,
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
                            context, CupertinoPageRoute(builder: (BuildContext context) => const ForfaitVoixPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call,
                            size: 40,
                            color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Forfait voix',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
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
                                    const ForfaitDataPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.earthAfrica,
                            size: 40,
                            color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Forfait data',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
      
                      const SizedBox(height: 20),
      
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
                                    const ForfaitMixtePage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.mixer,
                            size: 40,
                            color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Forfait mixte',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
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
                                    const ForfaitNuitPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (context.watch<Reseaux>().reseau=="Togocom") ? ColorConstants.colorCustomButtonTg : ColorConstants.colorCustomButtonMv,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.nights_stay,
                            size: 40,
                            color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Forfait nuit',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: (context.watch<Reseaux>().reseau=="Togocom") ? Colors.black : Colors.white,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
