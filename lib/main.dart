import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas1_187221026',
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 255, 255, 1),
          useMaterial3: true,
          fontFamily: GoogleFonts.ibmPlexSans().fontFamily),
      home: Homepage(),
    );
  }
}
