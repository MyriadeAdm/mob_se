import 'package:mob_se/objets/forfait_mixte.dart';
import 'package:mob_se/objets/forfait_nuit.dart';

import '../objets/forfait_appel.dart';
import '../objets/forfait_internet.dart';
import '../objets/historique.dart';

class Constantes {
  static final List<ForfaitInternet> forfaitsInternet = [
    ForfaitInternet('45 Mo', 'Validité 1 j', '100 XOF'),
    ForfaitInternet('100 Mo', 'Validité 1 j', '200 XOF'),
    ForfaitInternet('180 Mo', 'Validité 3 j', '350  XOF'),
    ForfaitInternet('400 Mo', 'Validité 3 j', '600 XOF'),
    ForfaitInternet('1 Go', 'Validité 7 j', '1.000 XOF'),
    ForfaitInternet('1,6 Go', 'Validité 7 j', '1.500 XOF'),
    ForfaitInternet('3 Go', 'Validité 30 j', '3.000 XOF'),
    ForfaitInternet('6 Go', 'Validité 30 j', '5.000 XOF'),
    ForfaitInternet('20 Go', 'Validité 30 j', '10.000 XOF'),
    ForfaitInternet('60 Go', 'Validité 30 j', '15.000 XOF'),
    ForfaitInternet('110 Go', 'Validité 30 j', '25.000 XOF'),
  ];

  static final List<ForfaitMixte> forfaitsMixte = [
    ForfaitMixte('700 TR', '20 Mo', '25 SMS', 'Validité 1 j', '200 XOF'),
    ForfaitMixte('1500 TR', '35 Mo', '25 SMS', 'Validité 1 j', '300 XOF'),
    ForfaitMixte('2200 TR', '70 Mo', '25 sms', 'Validité 2 j', '500 XOF'),
    ForfaitMixte('5400 TR', '120 Mo', '50 SMS', 'Validité 7 j', '1.000 XOF'),
    ForfaitMixte('13500 TR', '350 Mo', '50 SMS', 'Validité 7 j', '2.500 XOF'),
    ForfaitMixte('42000 TR', '2 Go', '100 SMS', 'Validité 30 j', '7.500 XOF'),
  ];

  static final List<ForfaitAppel> forfaitsAppel = [
    ForfaitAppel('1000 TR', '25 SMS', 'Validité 1 j', '200 XOF', '*909*4*1*1*1#'),
    ForfaitAppel('1800 TR', '75 SMS', 'Validité 2 j', '400 XOF', '*909*4*1*3*1#'),
    ForfaitAppel('2500 TR', '25 SMS', 'Validité 3 j', '500 XOF', '*909*4*1*2*1#'),
    ForfaitAppel('3100 TR', '75 SMS', 'Validité 3 j', '600 XOF', '*909*4*1*4*1#'),
    ForfaitAppel('5500 TR', '50 SMS', 'Validité 7 j', '1.000 XOF', '*909*4*2*1*1#'),
    ForfaitAppel('12000 TR', '100 SMS', 'Validité 7 j', '2.000 XOF', '*909*4*2*2*1#'),
    ForfaitAppel('17100 TR', '100 SMS', 'Validité 7 j', '3.000 XOF', '*909*4*2*3*1#'),
    ForfaitAppel('60000 TR', '200 SMS', 'Validité 30 j', '9.000 XOF', '*909*4*3*1*1#'),
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