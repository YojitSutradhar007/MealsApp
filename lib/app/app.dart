import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
        scaffoldBackgroundColor: Colors.black12,
        appBarTheme:  const AppBarTheme(color: Colors.black45),
        textTheme:
        Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.sansita().fontFamily,
      ),
      home: const CategoriesScreen(),
    );
  }
}
