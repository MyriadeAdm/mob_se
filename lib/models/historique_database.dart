import 'package:flutter/foundation.dart';
import 'package:mob_se/models/historique.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class HistoriqueDatabase extends ChangeNotifier{
  
  static late Isar isar;

  // I N I T I A L I Z E - D A T A B A S E
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HistoriqueSchema],
      directory: dir.path,
    );
  }

  // list of historiques
  final List<Historique> currentHistoriques = [];

  // C R E A T E - an historique and save to db
  Future<void> addHistorique(String typeForfait, String detailsForfait) async {

    // create a new user object
    final newHistorique = Historique(typeForfait, detailsForfait);

    // save to db
    await isar.writeTxn(() => isar.historiques.put(newHistorique));

    // re-read from db
    await fetchHistoriques();
  }

  // R E A D - historique from db
  Future<void> fetchHistoriques() async {
    List<Historique> fetchedHistoriques = await isar.historiques.where().findAll();
    currentHistoriques.clear();
    currentHistoriques.addAll(fetchedHistoriques);
    notifyListeners();
  }
}