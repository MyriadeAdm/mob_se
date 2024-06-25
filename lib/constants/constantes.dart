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
    ForfaitAppel('1000 TR', '25', '1 j', '200'),
    ForfaitAppel('1800 TR', '75', '2 j', '400'),
    ForfaitAppel('2500 TR', '25', '3 j', '500'),
    ForfaitAppel('3100 TR', '75', '3 j', '600'),
    ForfaitAppel('5500 TR', '50', '7 j', '1000'),
    ForfaitAppel('12000 TR', '100', '7 j', '2000'),
    ForfaitAppel('17100 TR', '100', '7 j', '3000'),
    ForfaitAppel('60000 TR', '200', '30 j', '9000'),
  ];

  static final List<Historique> historique = [
    Historique('Forfait Appel', '350 mo', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '1000 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Internet', '200 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '200 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '200 xof', DateTime.now().toString().substring(0,10)),
  ];
}