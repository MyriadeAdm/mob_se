import 'package:mob_se/objets/forfait_mixte.dart';
import 'package:mob_se/objets/forfait_nuit.dart';

import '../objets/forfait_appel.dart';
import '../objets/forfait_internet.dart';
import '../objets/historique.dart';

class Constantes {
  static final List<ForfaitInternet> forfaitsInternet = [
    ForfaitInternet('45 Mo', '1 j', '100'),
    ForfaitInternet('100 Mo', '1 j', '200'),
    ForfaitInternet('180 Mo', '3 j', '350'),
    ForfaitInternet('400 Mo', '3 j', '600'),
    ForfaitInternet('1 Go', '7 j', '1000'),
    ForfaitInternet('1,6 Go', '7 j', '1500'),
    ForfaitInternet('3 Go', '30 j', '3000'),
    ForfaitInternet('6 Go', '30 j', '5000'),
    ForfaitInternet('20 Go', '30 j', '10000'),
    ForfaitInternet('60 Go', '30 j', '15000'),
    ForfaitInternet('110 Go', '30 j', '25000'),
  ];

  static final List<ForfaitMixte> forfaitsMixte = [
    ForfaitMixte('700 TR', '20 Mo', '25', '1 j', '200'),
    ForfaitMixte('1500 TR', '35 Mo', '25', '1 j', '300'),
    ForfaitMixte('2200 TR', '70 Mo', '25', '2 j', '500'),
    ForfaitMixte('5400 TR', '120 Mo', '50', '7 j', '1000'),
    ForfaitMixte('13500 TR', '350 Mo', '50', '7 j', '2500'),
    ForfaitMixte('42000 TR', '2 Go', '100', '30 j', '7500'),
  ];

  static final List<ForfaitAppel> forfaitsAppel = [
    ForfaitAppel('1000 TR', '25', '1 j', '200', '*909*4*1*1*1#'),
    ForfaitAppel('1800 TR', '75', '2 j', '400', '*909*4*1*3*1#'),
    ForfaitAppel('2500 TR', '25', '3 j', '500', '*909*4*1*2*1#'),
    ForfaitAppel('3100 TR', '75', '3 j', '600', '*909*4*1*4*1#'),
    ForfaitAppel('5500 TR', '50', '7 j', '1000', '*909*4*2*1*1#'),
    ForfaitAppel('12000 TR', '100', '7 j', '2000', '*909*4*2*2*1#'),
    ForfaitAppel('17100 TR', '100', '7 j', '3000', '*909*4*2*3*1#'),
    ForfaitAppel('60000 TR', '200', '30 j', '9000', '*909*4*3*1*1#'),
  ];

  static final List<ForfaitNuit> forfaitsNuit = [
    ForfaitNuit('3 Go', '1j (22h-06h)', '500'),
  ];

  static final List<Historique> historique = [
    Historique('Forfait Appel', '350 mo', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '1000 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Internet', '200 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '200 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '200 xof', DateTime.now().toString().substring(0,10)),
  ];
}