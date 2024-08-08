import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mob_se/constants/color_constants.dart';
import 'package:mob_se/constants/constantes.dart';
import 'package:mob_se/widgets/custom_button.dart';
import 'package:mob_se/widgets/custom_list_view_forfait_appel.dart';
import 'package:mob_se/widgets/custom_list_view_forfait_internet.dart';
import 'package:provider/provider.dart';
import '../../models/historique.dart';
import '../../models/historique_database.dart';
import 'package:intl/intl.dart';
import 'package:mob_se/pages/menu_accueil/page_historique.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const List<String> carriername = ['Togocom', 'Moov'];

class _HomePageState extends State<HomePage> {
  var cname = 'Togocom';
  var mb = 'Tmoney';
  final List<bool> _selectedcarrier = <bool>[true, false];

  // Fonction de recupération des historiques dans la base de donnée
  void readHistorque() {
    context.read<HistoriqueDatabase>().fetchHistoriques();
  }

  @override
  void initState() {
    super.initState();
    readHistorque();
  }

  @override
  Widget build(BuildContext context) {
    final historiqueDatabase = context.watch<HistoriqueDatabase>();
    List<Historique> currentHistoriques = historiqueDatabase.currentHistoriques;

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
                  padding: const EdgeInsets.only(left: 15),
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
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  //print('button tapped');
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        'Sélectionner votre reseaux',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      content: SizedBox(
                        height: 80,
                        child: Center(
                          child: ToggleButtons(
                            onPressed: (int index) {
                              setState(() {
                                // The button that is tapped is set to true, and the others to false.
                                for (int i = 0;
                                    i < _selectedcarrier.length;
                                    i++) {
                                  _selectedcarrier[i] = i == index;
                                  if (index == 0) {
                                    cname = 'Togocom';
                                    mb = 'Tmoney';
                                  } else {
                                    cname = 'Moov';
                                    mb = 'Flooz';
                                  }
                                }
                              });
                              Navigator.of(context).pop();
                            },
                            borderRadius:
                                const BorderRadius.all(Radius.circular(13)),
                            selectedBorderColor: Colors.amber,
                            selectedColor: Colors.black,
                            fillColor: Colors.amber,
                            color: Colors.amber,
                            constraints: const BoxConstraints(
                              minHeight: 40.0,
                              minWidth: 80.0,
                            ),
                            isSelected: _selectedcarrier,
                            children: [
                              Text(carriername[0]),
                              Text(carriername[1]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  cname,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: CustomButton(
                        label: 'Solde credit',
                        code: (cname == 'Togocom') ? "*909*0#" : "*101#")),
                const SizedBox(width: 20),
                Expanded(
                    child: CustomButton(
                        label: 'Solde $mb',
                        code: (cname == 'Togocom') ? "*145#" : "")),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 18),
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
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    // width: 200,
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
                    icon: const Icon(
                      Icons.public,
                      size: 20,
                      color: Colors.black,
                    ),
                    mega: item.mega,
                    validite: item.validite,
                    prix: item.prix,
                    codeMMCredit: item.codeMMCredit,
                    codeAutruiCredit: item.codeAutruiCredit,
                    codeMoneyMM: item.codeMoneyMM,
                    codeMoneyAutruit: item.codeMoneyAutruit,
                    typeforfait: item.typeforfait,
                  );
                }),
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 15, left: 15, top: 20, bottom: 18),
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
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    //width: 200,
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
                  icon: const Icon(
                    Icons.call,
                    size: 20,
                    color: Colors.black,
                  ),
                  credit: item.credit,
                  validite: item.validite,
                  msg: item.msg,
                  prix: item.prix,
                  codeMMCredit: item.codeMMCredit,
                  codeAutruiCredit: item.codeAutruiCredit,
                  codeMoneyMM: item.codeMoneyMM,
                  codeMoneyAutruit: item.codeMoneyAutruit,
                  mega: item.mega,
                  typeforfait: item.typeforfait,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const PageHistorique()));
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size
                        .zero, // enleve le padding par defaut sur le boutton
                    padding: EdgeInsets.zero, // ca aussi
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'Tout afficher',
                        style: TextStyle(color: ColorConstants.colorCustom3),
                      ),
                      Icon(
                        Icons.trending_flat,
                        size: 20,
                        color: ColorConstants.colorCustom3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Container(
              height: 258,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                color: Color.fromRGBO(241, 240, 240, 1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: currentHistoriques.isEmpty
                        ? const Center(
                            child: Text(
                              'Historique vide, veuillez lancer \nvotre première transaction',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorConstants.colorCustom3,
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: currentHistoriques.length,
                            itemBuilder: (BuildContext context, int index) {
                              final reversehistorique =
                                  currentHistoriques.reversed.toList();
                              final historique = reversehistorique[index];
                              String date = "";
                              int dateNow = int.parse(
                                  DateFormat.d().format(DateTime.now()));

                              int dateHistorique = int.parse(
                                  DateFormat.d().format(historique.dateTime));

                              if (DateFormat('dd-MMM-yyyy')
                                      .format(historique.dateTime) ==
                                  DateFormat('dd-MMM-yyyy')
                                      .format(DateTime.now())) {
                                date =
                                    "Aujourd'hui ${DateFormat.Hm().format(historique.dateTime)}";
                              } else {
                                if (DateFormat('dd-MMM-yyyy')
                                        .format(historique.dateTime) !=
                                    DateFormat('dd-MMM-yyyy')
                                        .format(DateTime.now())) {
                                  if (dateNow - dateHistorique == 1) {
                                    date =
                                        "Hier ${DateFormat.Hm().format(historique.dateTime)}";
                                  } else {
                                    date = DateFormat("dd-MMM-yyyy HH:mm")
                                        .format(historique.dateTime);
                                  }
                                }
                              }
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 55,
                                    child: ListTile(
                                      title: Text(
                                        historique.typeForfait as String,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${historique.detailsForfait}',
                                            style: const TextStyle(fontSize: 9),
                                          ),
                                          Text(
                                            date,
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    color: Colors.black,
                                    height: 0.5,
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}