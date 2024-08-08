import 'type_forfait.dart';

class ForfaitNuit {
  String mega;
  String validite;
  String prix;
  String codeMMCredit;
  String codeAutruiCredit;
  String codeMoneyMM;
  String codeMoneyAutruit;
  Typeforfait typeforfait = Typeforfait.forfaitNuit;

  ForfaitNuit(this.mega, this.validite, this.prix, this.codeMMCredit, this.codeAutruiCredit, this.codeMoneyMM, this.codeMoneyAutruit);
}