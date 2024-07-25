import 'package:flutter/material.dart';
import 'package:mob_se/models/historique_database.dart';
import 'package:mob_se/pages/page_parametre.dart';
import 'package:mob_se/pages/transactions_page.dart';
import 'package:mob_se/widgets/custom_app_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';
import './home_page.dart';
import './forfait_page.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  // Le code suivant servira a tester la section d'enregistrement des historiques
  // manuellement avec un formulaire.. Il sera retirer plus tard
  // ================================
  final typeForfaitController = TextEditingController();
  final detailsForfaitController = TextEditingController();

  void createHistorique() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Type du forfait'),
            TextField(
              controller: typeForfaitController,
            ),
            const Text('Détail du forfait'),
            TextField(
              controller: detailsForfaitController,
            ),
          ],
        ),
        actions: [
          // Bouton de sauvegarde dans la base de donnees
          MaterialButton(
            onPressed: () {
              context.read<HistoriqueDatabase>().addHistorique(
                  typeForfaitController.text, detailsForfaitController.text);

              // Sortie du showDialog
              Navigator.pop(context);

              // Reinitialisation des textControllers apres enregistrement
              typeForfaitController.clear();
              detailsForfaitController.clear();
            },
            child: const Text('Enregistrer'),
          )
        ],
      ),
    );
  }

// ==================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Accueil",
            ),
          ),
          PersistentTabConfig(
            screen: const ForfaitPage(),
            item: ItemConfig(
              icon: const Icon(Icons.sync_alt),
              title: "Forfaits",
            ),
          ),
          PersistentTabConfig(
            screen: const TransactionsPage(),
            item: ItemConfig(
              icon: const Icon(Icons.attach_money),
              title: "Transactions",
            ),
          ),
          PersistentTabConfig(
            screen: const PageParametre(),
            item: ItemConfig(
              icon: const Icon(Icons.settings),
              title: "Parametre",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createHistorique,
        child: const Icon(Icons.add),
      ),
    );
  }
}
