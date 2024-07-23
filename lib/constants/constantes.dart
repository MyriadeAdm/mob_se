import 'package:mob_se/models/forfait_mixte.dart';
import 'package:mob_se/models/forfait_nuit.dart';

import '../models/forfait_appel.dart';
import '../models/forfait_internet.dart';
import '../models/solde.dart';
import '../models/historique.dart';

class Constantes {
    static final List<Solde> solde = [
    Solde('data', '*909*9*1*2*1#'),
    Solde('voix', '*909*9*1*2*3#'),
    Solde('mixte', '*909*9*1*2*2#'),
  ];

  static final List<ForfaitInternet> forfaitsInternet = [ 
    //   Forfait moi-meme , Forfait autruit]
    ForfaitInternet('45 Mo', 'Validité 1 j', '100 XOF','*909*2*1*2*1#', '*1*1*2*1#'),
    ForfaitInternet('100 Mo', 'Validité 1 j', '200 XOF','*909*2*1*3*1#', '*1*1*3*1#'),
    ForfaitInternet('250 Mo', 'Validité 1 j', '250 XOF','*909*2*1*1*1#', '*1*1*1*1#'),
    ForfaitInternet('180 Mo', 'Validité 3 j', '350  XOF','*909*2*1*4*1#', '*1*1*4*1#'),
    ForfaitInternet('400 Mo', 'Validité 3 j', '600 XOF','*909*2*1*6*1#', '*1*1*6*1#'),
    ForfaitInternet('1 Go', 'Validité 7 j', '1.000 XOF','*909*2*2*1*1#', '*1*2*1*1#'),
    ForfaitInternet('1,6 Go', 'Validité 7 j', '1.500 XOF','*909*2*2*2*1#', '*1*2*2*1#'),
    ForfaitInternet('3 Go', 'Validité 30 j', '3.000 XOF','*909*2*3*1*1#', '*1*3*1*1#'),
    ForfaitInternet('6 Go', 'Validité 30 j', '5.000 XOF','*909*2*3*2*1#', '*1*3*2*1#'),
    ForfaitInternet('20 Go', 'Validité 30 j', '10.000 XOF','*909*2*3*3*1#', '*1*3*3*1#'),
    ForfaitInternet('60 Go', 'Validité 30 j', '15.000 XOF','*909*2*3*4*1#', '*1*3*4*1#'),
    ForfaitInternet('110 Go', 'Validité 30 j', '25.000 XOF','*909*2*3*5*1#', '*1*3*5*1#'),
  ];

  static final List<ForfaitMixte> forfaitsMixte = [ //  ] Forfait moi-meme , Forfait autruit]
    ForfaitMixte('700f v TR', '20 Mo', '25 SMS', 'Validité 1 j', '200 XOF','*909*3*1*1*1#', ''),
    ForfaitMixte('1.000f v TR', '35 Mo', '25 SMS', 'Validité 1 j', '250 XOF','*909*3*1*4*1#', ''),
    ForfaitMixte('1.500f v TR', '35 Mo', '25 SMS', 'Validité 1 j', '300 XOF','*909*3*1*2*1#', ''),
    ForfaitMixte('2.200f v TR', '70 Mo', '25 sms', 'Validité 2 j', '500 XOF','*909*3*1*3*1#', ''),
    ForfaitMixte('5.400f v TR', '120 Mo', '50 SMS', 'Validité 7 j', '1.000 XOF','*909*3*2*1*1#', ''),
    ForfaitMixte('13.500f v TR', '350 Mo', '50 SMS', 'Validité 7 j', '2.500 XOF','*909*3*2*2*1#', ''),
    ForfaitMixte('20.000f v TR', '1 Go', '100 SMS', 'Validité 30 j', '5.000 XOF','*909*3*3*2*1#', ''),
    ForfaitMixte('42.000f v TR', '2 Go', '100 SMS', 'Validité 30 j', '7.500 XOF','*909*3*3*1*1#', ''),
    ForfaitMixte('400 min', '3 Go', '100 SMS', 'Validité 7 j', '10.000 XOF','*909*3*3*3*1#', ''),
  ];

  static final List<ForfaitAppel> forfaitsAppel = [ //  ] Forfait moi-meme , Forfait autruit]
    ForfaitAppel('1.000f v TR', '25 SMS', 'Validité 1 j', '200 XOF', '*909*4*1*1*1#', '*3*1*1*1#'),
    ForfaitAppel('1.800f v TR', '75 SMS', 'Validité 2 j', '400 XOF', '*909*4*1*3*1#', '*3*1*3*1#'),
    ForfaitAppel('2.500f v TR', '25 SMS', 'Validité 3 j', '500 XOF', '*909*4*1*2*1#', '*3*1*2*1#'),
    ForfaitAppel('3.100f v TR', '75 SMS', 'Validité 3 j', '600 XOF', '*909*4*1*4*1#', '*3*1*4*1#'),
    ForfaitAppel('5.500f v TR', '50 SMS', 'Validité 7 j', '1.000 XOF', '*909*4*2*1*1#', '*3*2*1*1#'),
    ForfaitAppel('12.000f v TR', '100 SMS', 'Validité 7 j', '2.000 XOF', '*909*4*2*2*1#', '*3*2*2*1#'),
    ForfaitAppel('17.100f v TR', '100 SMS', 'Validité 7 j', '3.000 XOF', '*909*4*2*3*1#', '*3*2*3*1#'),
    ForfaitAppel('60.000f v TR', '200 SMS', 'Validité 30 j', '9.000 XOF', '*909*4*3*1*1#', '*3*3*1*1#'),
  ];

  static final List<ForfaitNuit> forfaitsNuit = [ //  ] Forfait moi-meme , Forfait autruit]
    ForfaitNuit('3 Go', 'Validité 1j (22h-06h)', '500 XOF', '*909*2*1*5*1#', '*1*1*5*1#'),
  ];

  static final List<Historique> historique = [
    Historique('Forfait Appel', '350 mo', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '1000 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Internet', '200 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '200 xof', DateTime.now().toString().substring(0,10)),
    Historique('Forfait Appel', '200 xof', DateTime.now().toString().substring(0,10)),
  ];
}
