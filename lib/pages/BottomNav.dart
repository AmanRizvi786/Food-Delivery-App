import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_app/pages/FoodOrder.dart';
import 'package:food_app/pages/UserProfile.dart';
import 'package:food_app/pages/PaymentWallet.dart';
import 'AppHomepage.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTabIndex=0;
  late List<Widget> pages;
  late Widget currentPage;
  late AppHomepage homepage;
  late UserProfile profile;
  late PaymentWallet wallet;
  late FoodOrder order;

  @override
  void initState() {
    homepage=AppHomepage();
    order=FoodOrder();
    profile=UserProfile();
    wallet=PaymentWallet();

    pages=[homepage,order,wallet,profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.wallet_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outlined,
            color: Colors.white,
          ),
        ],

      ),

      body: pages[currentTabIndex],
    );
  }
}
