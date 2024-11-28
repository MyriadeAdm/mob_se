import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider with ChangeNotifier {
  SharedPreferences? _prefs;

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() async {
    _prefs = await SharedPreferences.getInstance();

    if (_themeData == lightMode) {
      themeData = darkMode;
      _prefs!.setBool('darkMode', true);
    } else {
      themeData = lightMode;
      _prefs!.setBool('darkMode', false);
    }
    notifyListeners();
  }
}
