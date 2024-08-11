import 'package:flutter/material.dart';

class Reseaux extends ChangeNotifier{
  String reseau;

  Reseaux({this.reseau="TOGOCOM"});

  void switchToTogocom () {
    reseau = "TOGOCOM";
    notifyListeners();
  }

  void switchToMoov () {
    reseau = "MOOV";
    notifyListeners();
  }
}