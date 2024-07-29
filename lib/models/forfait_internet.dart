
import 'type_forfait.dart';

class ForfaitInternet {
  String mega;
  String validite;
  String prix;
  String codeMMCredit;
  String codeAutruiCredit;
  Typeforfait typeforfait = Typeforfait.forfaitInternet;

  ForfaitInternet(this.mega, this.validite, this.prix, this.codeMMCredit, this.codeAutruiCredit);
}