import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/pages/Fooddetails.dart';
import 'package:food_app/widgets/widget_support.dart';

class AppHomepage extends StatefulWidget {
  const AppHomepage({super.key});

  @override
  State<AppHomepage> createState() => _AppHomepageState();
}

class _AppHomepageState extends State<AppHomepage> {
  bool iceCream = false, pizza = false, salad = false, burger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 45,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 22),
                    child: Text("Hello Aman", style: AppWidget.boldTextStyle()),
                  ),
                  Container(
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.only(right: 22),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child:
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                  )
                ],
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 22),
                child: Text("Delicious Food", style: AppWidget.HeaderTextStyle()),
              ),
              Container(
                margin: EdgeInsets.only(left: 22),
                child: Text("Discover and Get Great Food",
                    style: AppWidget.LightTextStyle()),
              ),
              SizedBox(
                height: 20,
              ),
             ShowItem(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetails(),));
                          },
                          child: Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding:EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 3),
                                    Image.asset("images/salad2.png",height: 150,width: 150,fit: BoxFit.cover,),
                                    SizedBox(height: 5),
                                    Text("Veggie Taco Hash",style: AppWidget.SemiboldTextStyle(),),
                                    SizedBox(height: 3),
                                    Text("Fresh and Healthy",style: AppWidget.LightTextStyle(),),
                                    SizedBox(height: 5),
                                    Text("\$25",style: AppWidget.SemiboldTextStyle(),),
                                  ],
                                ),
                              ),
                            ),
                        ),

                        SizedBox(width: 5),

                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding:EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 3),
                                Image.asset("images/salad4.png",height: 150,width: 150,fit: BoxFit.cover,),
                                SizedBox(height: 5),
                                Text("Mix Veg Salad",style: AppWidget.SemiboldTextStyle(),),
                                SizedBox(height: 3),
                                Text("Spicy with Onion",style: AppWidget.LightTextStyle(),),
                                SizedBox(height: 5),
                                Text("\$28",style: AppWidget.SemiboldTextStyle(),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              Container(
                margin: EdgeInsets.only(right: 22,left: 22),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Image.asset("images/salad4.png",height: 120,width: 120,fit: BoxFit.cover,),
                      SizedBox(width: 20),
                      Column(children: [
                        SizedBox(height: 3),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                            child: Text("Mediterranean Chickpea Salad",style: AppWidget.SemiboldTextStyle(),)
                        ),
                        SizedBox(height: 3),
                        Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("Honey Goot Cheese",style: AppWidget.LightTextStyle(),)
                        ),
                        SizedBox(height: 5),
                        Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Text("\$28",style: AppWidget.SemiboldTextStyle(),)
                        )
                      ],)
                    ],),
                  ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(right: 22,left: 22),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Image.asset("images/salad2.png",height: 120,width: 120,fit: BoxFit.cover,),
                          SizedBox(width: 20),
                          Column(children: [
                            SizedBox(height: 3),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("Veggie Taco Hash",style: AppWidget.SemiboldTextStyle(),)
                            ),
                            SizedBox(height: 3),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("Honey Goot Cheese",style: AppWidget.LightTextStyle(),)
                            ),
                            SizedBox(height: 5),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("\$28",style: AppWidget.SemiboldTextStyle(),)
                            )
                          ],)
                        ],),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget ShowItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            iceCream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {

            });
          },
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(color: iceCream?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/ice-cream.png",
                height: 45,
                width: 45,
                color: iceCream?Colors.white:Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {

            });
          },
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(color: pizza?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/pizza.png",
                height: 45,
                width: 45,
                color: pizza?Colors.white:Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {

            });
          },
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(color: salad?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/salad.png",
                height: 45,
                width: 45,
                color: salad?Colors.white:Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            iceCream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {

            });
          },
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(color: burger?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "images/burger.png",
                height: 45,
                width: 45,
                color: burger?Colors.white:Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
