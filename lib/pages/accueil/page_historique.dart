import 'package:flutter/material.dart';
import '../../models/historique.dart';
import '../../models/historique_database.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:mob_se/constants/color_constants.dart';

class PageHistorique extends StatefulWidget {
  const PageHistorique({super.key});

  @override
  State<PageHistorique> createState() => _PageHistoriqueState();
}

class _PageHistoriqueState extends State<PageHistorique> {
  // Fonction de recupération des historiques dans la base de donnée
  void readHistorque() {
    context.read<HistoriqueDatabase>().fetchHistoriques();
  }

  @override
  void initState() {
    super.initState();
    readHistorque();
  }

  IconButton returnBack(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget build(BuildContext context) {
    final historiqueDatabase = context.watch<HistoriqueDatabase>();
    List<Historique> currentHistoriques = historiqueDatabase.currentHistoriques;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                returnBack(context),
                const Text(
                  "Historique",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const Divider(
              height: 30,
              indent: 50,
              endIndent: 50,
              color: Colors.black,
              thickness: 1,
            ),
            Expanded(
              child: currentHistoriques.isEmpty
                  ? const Center(
                      child: Text(
                        'Historique vide, veuillez lancer \nvotre première transaction ...',
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorConstants.colorCustom3,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: currentHistoriques.length,
                      itemBuilder: (BuildContext context, int index) {
                        final reversehistorique =
                            currentHistoriques.reversed.toList();
                        final historique = reversehistorique[index];
                        String date = "";
                        int dateNow =
                            int.parse(DateFormat.d().format(DateTime.now()));

                        int dateHistorique = int.parse(
                            DateFormat.d().format(historique.dateTime));

                        if (DateFormat('dd-MMM-yyyy')
                                .format(historique.dateTime) ==
                            DateFormat('dd-MMM-yyyy').format(DateTime.now())) {
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
                        return ListTile(
                          title: Text(
                            historique.typeForfait as String,
                            style: const TextStyle(fontSize: 15),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${historique.detailsForfait}',
                                  style: const TextStyle(fontSize: 9),
                                ),
                              ),
                              Text(
                                date,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
