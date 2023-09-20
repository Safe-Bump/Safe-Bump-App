import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_bump/injection.dart';
import 'package:safe_bump/navigation/router.dart';
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
          debugShowCheckedModeBanner: false,
          title: 'Safe Bump',
          initialRoute: isViewed == null
              ? NavigationRoutes.onboarding
              : (firebaseAuth.currentUser == null
                  ? NavigationRoutes.login
                  : NavigationRoutes.mainScreen),
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
              primarySwatch: Colors.pink,
              scaffoldBackgroundColor: const Color(0xFFf5f6fb),
              textTheme: TextTheme(
                headlineLarge: TextStyle(
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 26.sp),
                headlineMedium:
                    TextStyle(fontFamily: 'ProductSans', fontSize: 20.sp),
                bodyLarge:
                    TextStyle(fontFamily: 'ProductSans', fontSize: 12.sp),
                bodyMedium:
                    TextStyle(fontFamily: 'ProductSans', fontSize: 10.sp),
                bodySmall: GoogleFonts.inter(),
              )),
        );
      },
    );
  }
}
