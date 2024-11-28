import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mob_se/constants/reseaux.dart';
import 'package:mob_se/models/historique_database.dart';
import 'package:mob_se/pages/config_reseau.dart';
import 'package:mob_se/pages/splash_screen.dart';
import 'package:mob_se/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/base.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // initialize historique database
  WidgetsFlutterBinding.ensureInitialized();
  await HistoriqueDatabase.initialize();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HistoriqueDatabase()),
      ChangeNotifierProvider(create: (context) => Reseaux()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  SharedPreferences? _prefs;
  var _isLoading = true; // État pour gérer le chargement

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    getPrefsNetwork();
    getPrefsDarkMode();
  }

  void getPrefsNetwork() {
    if (_prefs?.getString('reseau') == "Yas") {
      context.read<Reseaux>().switchToTogocom();
    } else if (_prefs?.getString('reseau') == "Moov") {
      context.read<Reseaux>().switchToMoov();
    } else {
      const ConfigReseau();
    }
  }

  void getPrefsDarkMode() {
    if (_prefs?.getBool('darkMode') == true) {
      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    }
  }

  Widget firstPage() {
    if (_isLoading) {
      return const Scaffold(
          body: Center(
              child:
                  SplashScreen())); // Afficher le spinner pendant le chargement
    }

    if (context.watch<Reseaux>().reseau == '') {
      return const ConfigReseau();
    } else {
      return const Base();
    }
  }

  @override
  void initState() {
    super.initState();
    _initPrefs();
    // Utiliser un Timer pour changer l'état après 1 seconde
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _isLoading = false; // Changer l'état de chargement
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: firstPage(),
    );
  }
}
