import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero_to_one_new/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zero to One',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor:Color.fromRGBO(224, 201, 166,1),),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(224, 201, 166,1)).copyWith(
          background: const Color.fromRGBO(224, 201, 166, 1),

        ),
        useMaterial3: true,
        textTheme:TextTheme(
          bodyMedium:  GoogleFonts.comicNeue(
           fontSize: 17
          ),
          titleLarge: GoogleFonts.comicNeue(),


        )


      ),
      home: const HomePage(),
    );
  }
}

