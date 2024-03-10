import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/homepages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas1_187221026',
      theme: defaultTheme,
      home: Homepage(),
    );
  }

  final ThemeData defaultTheme = ThemeData(
      primaryColor: const Color.fromRGBO(254, 251, 246, 1),
      scaffoldBackgroundColor: const Color.fromRGBO(254, 251, 246, 1),
      colorScheme:
          ColorScheme.fromSeed(seedColor: Color.fromRGBO(15, 44, 89, 1)),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(254, 251, 246, 1),
          iconTheme: IconThemeData(
            color: Color.fromRGBO(15, 44, 89, 1),
          )),
      fontFamily: GoogleFonts.ibmPlexSans().fontFamily,
      textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 30),
          displaySmall: TextStyle(fontSize: 15),
          headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(fontSize: 10, fontWeight: FontWeight.bold)));
}
