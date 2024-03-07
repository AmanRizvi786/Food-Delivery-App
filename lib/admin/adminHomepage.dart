import 'package:flutter/material.dart';
import 'package:food_app/widgets/widget_support.dart';
class AdminHomepage extends StatefulWidget {
  const AdminHomepage({super.key});

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text("Hello",style: AppWidget.WhiteSemiboldTextStyle(),),
      ),
    );
  }
}
