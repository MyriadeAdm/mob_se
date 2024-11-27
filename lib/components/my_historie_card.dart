import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mob_se/models/historique_database.dart';
import 'package:provider/provider.dart';

import '../models/historique.dart';

class MyHistorieCard extends StatefulWidget {
  const MyHistorieCard({super.key});

  @override
  State<MyHistorieCard> createState() => _MyHistorieCardState();
}

class _MyHistorieCardState extends State<MyHistorieCard> {

  void readHistorique() {
      context.read<HistoriqueDatabase>().fetchHistoriques();
    }

    @override
    void initState() {
      super.initState();
      readHistorique();
    }

  @override
  Widget build(BuildContext context) {
    List<Historique> currentHistoriques =
        Provider.of<HistoriqueDatabase>(context).currentHistoriques;

    return Flexible(
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Card(
          color: Theme.of(context).colorScheme.secondary,
          child: currentHistoriques.isEmpty
              ? const HistorieEmpty()
              : FullHistory(currentHistoriques: currentHistoriques),
        ),
      ),
    );
  }
}

class FullHistory extends StatelessWidget {
  const FullHistory({
    super.key,
    required this.currentHistoriques,
  });

  final List<Historique> currentHistoriques;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: currentHistoriques.length,
      itemBuilder: (BuildContext context, int index) {
        final reverseHistory = currentHistoriques.reversed.toList();
        final historique = reverseHistory[index];
        String date = "";
        int dateNow = int.parse(DateFormat.d().format(DateTime.now()));

        int dateHistorique =
            int.parse(DateFormat.d().format(historique.dateTime));

        if (DateFormat('dd-MMM-yyyy').format(historique.dateTime) ==
            DateFormat('dd-MMM-yyyy').format(DateTime.now())) {
          date = "Aujourd'hui ${DateFormat.Hm().format(historique.dateTime)}";
        } else {
          if (DateFormat('dd-MMM-yyyy').format(historique.dateTime) !=
              DateFormat('dd-MMM-yyyy').format(DateTime.now())) {
            if (dateNow - dateHistorique == 1) {
              date = "Hier ${DateFormat.Hm().format(historique.dateTime)}";
            } else {
              date =
                  DateFormat("dd-MMM-yyyy HH:mm").format(historique.dateTime);
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${historique.detailsForfait}',
                      style: const TextStyle(fontSize: 9),
                    ),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 0.5,
              width: MediaQuery.of(context).size.width * 0.90,
            ),
          ],
        );
      },
    );
  }
}

class HistorieEmpty extends StatelessWidget {
  const HistorieEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Historique vide, veuillez lancer \nvotre première transaction',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
