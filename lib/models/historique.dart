import 'package:isar/isar.dart';

part 'historique.g.dart';

@Collection()
class Historique {
  Id? id;
  String? typeForfait;
  String? detailsForfait;
  DateTime dateTime = DateTime.now();

  Historique(this.typeForfait, this.detailsForfait);
}