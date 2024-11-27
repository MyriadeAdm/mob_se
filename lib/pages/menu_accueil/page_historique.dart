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

  bool boolDelete = false;
  String supList = '';

  @override
  Widget build(BuildContext context) {
    final historiqueDatabase = context.watch<HistoriqueDatabase>();
    List<Historique> currentHistoriques = historiqueDatabase.currentHistoriques;
    //print(currentHistoriques);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          "Historique",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  boolDelete = !boolDelete;
                });
              },
              icon: const Icon(
                Icons.select_all,
                size: 30,
              )),
          Visibility(
            visible: boolDelete,
            child: IconButton(
                onPressed: () {
                  if (currentHistoriques.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 500),
                        content: Text("L'historique est vide")));
                  } else {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          'TOUT SUPPRIMER !',
                          textAlign: TextAlign.center,
                        ),
                        content: const Text(
                            "Etes-vous sur de vouloir tout supprimer ?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Annuler',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<HistoriqueDatabase>()
                                  .deleteAllHistorique();
                              Navigator.pop(context);
                              boolDelete = false;
                            },
                            child: const Text(
                              'Oui',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  boolDelete = false;
                },
                icon: const Icon(
                  Icons.delete_sharp,
                  size: 30,
                  color: Colors.red,
                )),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 30,
              indent: 50,
              endIndent: 50,
              color: Theme.of(context).colorScheme.inversePrimary,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
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

                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(Icons.delete_forever),
                            ),
                          ),
                          // key: ValueKey<int>(index),
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            // Remove the item from the data source.
                            setState(() {
                              currentHistoriques.removeAt(index);
                              //print(index);
                              context
                                  .read<HistoriqueDatabase>()
                                  .deleteHistorique(historique.id as int);
                              //print(historique.id);

                              if (reversehistorique.isNotEmpty) {
                                supList =
                                    '${reversehistorique[index].typeForfait} supprimé';
                              } else {
                                supList = 'Historique vide';
                              }
                            });

                            // Then show a snackbar.
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(milliseconds: 500),
                                content: Text(supList)));
                          },
                          child: ListTile(
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
