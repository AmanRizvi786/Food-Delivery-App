import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/pages/AppHomepage.dart';
import 'package:food_app/pages/OnboardingScreen.dart';
import 'package:food_app/pages/UserLogin.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xfffff0de)),
        //useMaterial3: true,
      ),
      home: OnboardingScreen(),
    );
  }
}


