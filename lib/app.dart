import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safe_bump/presentation/screen/dashboard_screen.dart';
import 'package:safe_bump/presentation/screen/login_screen.dart';

import 'navigation/navigation_module.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: TextTheme(
            headlineLarge: const TextStyle(
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.bold,
                fontSize: 30),
            headlineMedium:
                const TextStyle(fontFamily: 'ProductSans', fontSize: 24),
            bodyLarge: const TextStyle(fontFamily: 'ProductSans', fontSize: 14),
            bodyMedium:
                const TextStyle(fontFamily: 'ProductSans', fontSize: 12),
            bodySmall: GoogleFonts.inter(),
          )),
      home: const LoginScreen(),
    );
  }
}
