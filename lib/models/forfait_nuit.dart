import 'type_forfait.dart';

class ForfaitNuit {
  String mega;
  String validite;
  String prix;
  String codeMMCredit;
  String codeAutruiCredit;
  Typeforfait typeforfait = Typeforfait.forfaitNuit;

  ForfaitNuit(this.mega, this.validite, this.prix, this.codeMMCredit, this.codeAutruiCredit);
}