import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mob_se/constants/reseaux.dart';
import 'package:mob_se/models/historique_database.dart';
import 'package:mob_se/pages/config_reseau.dart';
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
    setPrefs();
  }

  void setPrefs() {
    if (_prefs?.getString('reseau') == "Togocom") {
      context.read<Reseaux>().switchToTogocom();
    } else if (_prefs?.getString('reseau') == "Moov") {
      context.read<Reseaux>().switchToMoov();
    } else {
      const ConfigReseau();
    }
  }

  Widget firstPage() {
    if (_isLoading) {
      return const Scaffold(
          body: Center(
              child:
                  CircularProgressIndicator())); // Afficher le spinner pendant le chargement
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
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false; // Changer l'état de chargement
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        highlightColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        indicatorColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        //colorSchemeSeed: Colors.white,
        //brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
        // fontFamily: GoogleFonts.poppins().fontFamily,
        fontFamily: 'Poppins',
      ),
      home: firstPage(),
    );
  }
}
