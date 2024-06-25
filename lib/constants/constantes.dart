import '../objets/forfait_appel.dart';
import '../objets/forfait_internet.dart';
import '../objets/historique.dart';

class Constantes {
  static final List<ForfaitInternet> forfaitsInternet = [
    ForfaitInternet('45 Mo', '1 jour', '100'),
    ForfaitInternet('100 Mo', '1 jour', '200'),
    ForfaitInternet('180 Mo', '1 jour', '350'),
    ForfaitInternet('180 Mo', '1 jour', '350'),
    ForfaitInternet('180 Mo', '1 jour', '350'),
  ];

  static final List<ForfaitAppel> forfaitsAppel = [
    ForfaitAppel('1000f V TR', '25', '1 j', '100'),
    ForfaitAppel('1000f V TR', '25', '1 j', '200'),
    ForfaitAppel('1000f V TR', '25', '1 j', '350'),
    ForfaitAppel('1000f V TR', '25', '1 j', '600'),
    ForfaitAppel('1000f V TR', '25', '1 j', '1000'),
  ];

  static final List<Historique> historique = [
    Historique('Forfait Appel', '350 mo', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '1000 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Internet', '200 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '200 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '200 xof', DateTime.now().toString().substring(0,10)),
  ];
}