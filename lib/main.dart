import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './pages/base.dart';

import 'package:permission_handler/permission_handler.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<void> initPlatformState() async {
    // Ask for permissions before requesting data
    await [
      Permission.phone,
      Permission.sms,
    ].request();
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ), 
      home:  const Base(),
    );
  }
}
