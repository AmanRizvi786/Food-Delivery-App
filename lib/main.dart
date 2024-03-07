import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_app/pages/BottomNav.dart';
import 'package:food_app/pages/UserLogin.dart';
import 'package:food_app/pages/OnboardingScreen.dart';
import 'package:food_app/pages/UserSignUp.dart';
import 'package:food_app/admin/admin_login.dart';
import 'package:food_app/widgets/app_ConstantValues.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Stripe.publishableKey=publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffffb9a1)),
        useMaterial3: true,
      ),
      home: BottomNavigation(),
    );
  }
}
