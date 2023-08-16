import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kistler/presentaion/bottom_nav_screen/view/bottom_nav_screen.dart';
import 'package:kistler/presentaion/splash_Screen/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
