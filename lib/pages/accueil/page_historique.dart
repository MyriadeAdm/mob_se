import 'package:flutter/material.dart';
import '../../models/historique.dart';
import '../../models/historique_database.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';



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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
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
            ),

            const Divider(
              height: 30,
              indent: 50,
              endIndent: 50,
              color: Colors.black,
              thickness: 1,
            ),

                        Expanded(
              child: ListView.builder(
                itemCount: currentHistoriques.length,
                itemBuilder: (BuildContext context, int index) {
                  final reversehistorique = currentHistoriques.reversed.toList();
                  final historique = reversehistorique[index];
                  return ListTile(
                          title: Text(
                            historique.typeForfait as String,
                            style: const TextStyle(fontSize: 15),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${historique.detailsForfait}',
                                style: const TextStyle(fontSize: 9),
                              ),
                              Text(
                                DateFormat('dd-MMM-yyyy HH:mm')
                                    .format(historique.dateTime),
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
