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
              Ink(
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: ColorConstants.colorCustom3,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.sim_card,
                      color: Colors.white,
                      size: 25,
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Togocom',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(label: 'Solde credit'),
              SizedBox(width: 15),
              CustomButton(label: 'Solde money'),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Forfait Internet",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 220,
                height: 10,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constantes.forfaitsInternet.length,
              itemBuilder: (BuildContext context, int index) {
                final item = Constantes.forfaitsInternet[index];
            
                return CustomListViewForfaitInternet(
                  icon: const Icon(Icons.public), 
                  mega: item.mega, 
                  validite: item.validite, 
                  prix: item.prix);
              } ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Forfait Appel",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 220,
                height: 10,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constantes.forfaitsAppel.length,
              itemBuilder: (BuildContext context, int index) {
                final item = Constantes.forfaitsAppel[index];
            
                return CustomListViewForfaitAppel(
                  icon: const Icon(Icons.call_end_outlined), 
                  credit: item.credit, 
                  validite: item.validite, 
                  msg: item.msg,
                  prix: item.prix);
              } ),
          ),
          const SizedBox(height: 10),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Historique',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  const SizedBox(width: 190,),
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
        ],
      ),
    );
  }
}
