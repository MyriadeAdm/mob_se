import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './pages/base.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(     
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ), 
      home:  const Base(),
    );
  }
}
