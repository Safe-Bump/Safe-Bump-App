import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/injection.dart';
import 'package:safe_bump/presentation/screen/login_screen.dart';
import 'package:safe_bump/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
bool? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getBool('onBoard');
  configureInjection(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return Sizer(
        builder: (context, orientation, deviceType) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/onboarding',

      // initialRoute: isViewed==null ? '/onboarding' : '/',
      onGenerateRoute: RouteGenerator.generateRoute,
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

    );},);

  }
}