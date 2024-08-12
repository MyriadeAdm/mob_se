import 'package:flutter/material.dart';

class Reseaux extends ChangeNotifier{
  String reseau;

  Reseaux({this.reseau=""});

  void switchToTogocom () {
    reseau = "TOGOCOM";
    notifyListeners();
  }

  void switchToMoov () {
    reseau = "MOOV";
    notifyListeners();
  }
}