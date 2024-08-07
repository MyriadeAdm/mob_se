import 'package:mob_se/models/type_forfait.dart';

class ForfaitAppel {
  String credit;
  String msg;
  String validite;
  String prix;
  String codeMMCredit;
  String codeAutruiCredit;
  String codeMoneyMM;
  String codeMoneyAutruit;
  // ignore: prefer_typing_uninitialized_variables
  var mega;
  Typeforfait typeforfait = Typeforfait.forfaitAppel;

  ForfaitAppel(this.credit, this.msg, this.validite, this.prix,  this.codeMMCredit, this.codeAutruiCredit, this.codeMoneyMM, this.codeMoneyAutruit, this.mega);
}