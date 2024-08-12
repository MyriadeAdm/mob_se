import 'package:flutter/material.dart';

class Reseaux extends ChangeNotifier{
  String reseau;
  String money;

  Reseaux({this.reseau="", this.money=""});

  void switchToTogocom () {
    reseau = "TOGOCOM";
    money = "T-Money";
    notifyListeners();
  }

  void switchToMoov () {
    reseau = "MOOV";
    money = "FLOOZ";
    notifyListeners();
  }
}