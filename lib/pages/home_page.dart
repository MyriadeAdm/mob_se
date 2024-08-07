import 'package:flutter/material.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';
import 'package:mob_se/widgets/custom_button.dart';
import 'package:mob_se/widgets/custom_list_view_forfait_appel.dart';
import 'package:mob_se/widgets/custom_list_view_forfait_internet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onVerticalDragDown: (details) {
                  //print('botn draged');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: Ink(
                    height: 50,
                    width: 35,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: ColorConstants.colorCustom3,
                    ),
                    child: const Icon(
                          Icons.sim_card,
                          color: Colors.white,
                          size: 20,
                        )),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  //print('button tapped');
                  showDialog(context: context, builder: (context)=>const AlertDialog(
                    title: Text('Selectionner votre reseaux',
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                    content:
                    SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(label:'Togocom'),
                          CustomButton(label: 'Moov'),
                        ],
                      ),
                    ),
                  )
                  );
                },
                child: const Text(
                  'Togocom',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: CustomButton(label: 'Solde credit')),
                SizedBox(width: 20),
                Expanded(child: CustomButton(label: 'Solde money')),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 15, left:15, top: 30, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Forfait Internet",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Container(
                  width: 200,
                  height: 10,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constantes.forfaitsInternet.length,
              itemBuilder: (BuildContext context, int index) {
                final item = Constantes.forfaitsInternet[index];
            
                return CustomListViewForfaitInternet(
                  icon: const Icon(Icons.public, size: 20,), 
                  mega: item.mega, 
                  validite: item.validite, 
                  prix: item.prix);
              } ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 15, left:15, top: 30, bottom: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Forfait Appel",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 200,
                  height: 10,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 0.8,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constantes.forfaitsAppel.length,
              itemBuilder: (BuildContext context, int index) {
                final item = Constantes.forfaitsAppel[index];
            
                return CustomListViewForfaitAppel(
                  icon: const Icon(Icons.call_end_outlined, size: 20,), 
                  credit: item.credit, 
                  validite: item.validite, 
                  msg: item.msg,
                  prix: item.prix);
              } ),
          ),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 18),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Historique',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: Colors.black),
                    ),

                    TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Text(
                              'Voir Plus',
                              style:
                                  TextStyle(color: ColorConstants.colorCustomButton),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 18,
                              color: ColorConstants.colorCustomButton,
                            ),
                          ],
                        ))
                  ],
                ),
           ),

        ],
      ),
    );
  }
}