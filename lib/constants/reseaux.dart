import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reseaux extends ChangeNotifier {
  String? reseau;
  String? money;
  SharedPreferences? _prefs;

  Reseaux({this.reseau = "", this.money = ""});

  void switchToTogocom() async {
    _prefs = await SharedPreferences.getInstance();

    reseau = "Yas";
    money = "Mixx";
    _prefs!.setString('reseau', 'Yas');
    notifyListeners();
  }

  void switchToMoov() async {
    _prefs = await SharedPreferences.getInstance();

    reseau = "Moov";
    money = "Flooz";
    _prefs!.setString('reseau', 'Moov');
    notifyListeners();
  }
}
