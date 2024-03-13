import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/pages/Fooddetails.dart';
import 'package:food_app/services/database.dart';
import 'package:food_app/widgets/widget_support.dart';

class AppHomepage extends StatefulWidget {
  const AppHomepage({super.key});

  @override
  State<AppHomepage> createState() => _AppHomepageState();
}

class _AppHomepageState extends State<AppHomepage> {
  bool iceCream = false, pizza = false, salad = false, burger = false;

  Stream? fooditemStream;
  ontheload() async{
    fooditemStream=await DatabaseMethods().getFoodItem("Pizza");

    setState(() {

    });
  }
  void initState(){
    ontheload();
  }

  Widget allItem(){
    return StreamBuilder(builder: (context,AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            DocumentSnapshot ds=snapshot.data.docs[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetails(foodImage: ds["Image"],foodDetails: ds["Detail"],foodName:ds["Name"],foodPrice:ds["Price"],),));
          },
          child: Container(
            margin: EdgeInsets.all(5),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  width: MediaQuery.of(context).size.width/2.2,
                padding:EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 3),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        ds["Image"],
                        height: 150,width: 155,fit: BoxFit.cover,
                                  
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(ds["Name"],style: AppWidget.SemiboldTextStyle(),),
                    SizedBox(height: 3),
                    Text(ds["Description"],maxLines: 1,style: AppWidget.LightTextStyle(),),
                    SizedBox(height: 5),
                    Text("\$"+ds["Price"],style: AppWidget.SemiboldTextStyle(),),
                  ],
                ),
              ),
            ),
          ),
        );
      }):CircularProgressIndicator();

      
    }, stream: fooditemStream,);
  }

  Widget allItemVertically(){
    return StreamBuilder(builder: (context,AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            DocumentSnapshot ds=snapshot.data.docs[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetails(foodImage: ds["Image"],foodDetails: ds["Detail"],foodName:ds["Name"],foodPrice:ds["Price"],),));
              },
              child: Container(
                //width: MediaQuery.of(context).size.width/1.1,
                margin: EdgeInsets.only(right: 20,left: 22,bottom: 7),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14,top: 14,bottom: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              ds["Image"],
                              height: 120,width: 120,fit: BoxFit.cover,),
                          ),
                          SizedBox(width: 20),
                          Column(children: [
                            SizedBox(height: 3),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(ds["Name"],style: AppWidget.SemiboldTextStyle(),)
                            ),
                            SizedBox(height: 3),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(ds["Description"],maxLines: 1,style: AppWidget.LightTextStyle(),)
                            ),
                            SizedBox(height: 5),
                            Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("\$"+ds["Price"],style: AppWidget.SemiboldTextStyle(),)
                            )
                          ],)
                        ],),
                    ),
                  ),
                ),
              ),
            );
          }):CircularProgressIndicator();


    }, stream: fooditemStream,);
  }


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
                    child: Text("Hello Foodie !", style: AppWidget.boldTextStyle()),
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
              SizedBox(height: 20,),
             ShowFoodItem(),
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(left: 22),
                  height: 300,

                  child: allItem()
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                child: allItemVertically(),
              ),

              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
  Widget ShowFoodItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () async {
            iceCream = true;
            pizza = false;
            salad = false;
            burger = false;
            fooditemStream=await DatabaseMethods().getFoodItem("Ice-cream");
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
          onTap: () async {
            iceCream = false;
            pizza = true;
            salad = false;
            burger = false;
            fooditemStream=await DatabaseMethods().getFoodItem("Pizza");
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
          onTap: () async {
            iceCream = false;
            pizza = false;
            salad = true;
            burger = false;
            fooditemStream=await DatabaseMethods().getFoodItem("Salad");
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
          onTap: () async {
            iceCream = false;
            pizza = false;
            salad = false;
            burger = true;
            fooditemStream=await DatabaseMethods().getFoodItem("Burger");
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
